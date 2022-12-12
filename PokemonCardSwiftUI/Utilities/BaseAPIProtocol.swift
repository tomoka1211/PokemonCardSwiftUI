//
//  BaseAPIProtocol.swift
//  PokemonCardSwiftUI
//
//  Created by hirano_tomoka on 2022/12/12.
//

import Alamofire
import Foundation

// MARK: - Base API Protocol

protocol BaseAPIProtocol {
    associatedtype ResponseType

    var method: HTTPMethod { get }
    var baseURL: URL { get }
    var path: String { get }
    var headers: HTTPHeaders? { get }
}

extension BaseAPIProtocol {
    var baseURL: URL {
        return try! "\(EnvironmentKey.rootUrl)".asURL()
    }
    
    var headers: HTTPHeaders? {
        return [
            "X-Api-Key": "\(EnvironmentKey.apiKey)",
            "X-Requested-With": "XMLHttpRequest"
        ]
    }
}

// MARK: - BaseRequestProtocol
protocol BaseRequestProtocol: BaseAPIProtocol, URLRequestConvertible {
    // MARK: - リクエストパラメータ
    var parameters: Parameters? { get }
    // MARK: - パラメータのエンコード用プロパティ
    var encoding: URLEncoding { get }
}

extension BaseRequestProtocol {
    var encoding: URLEncoding {
        return URLEncoding.default
    }

    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: baseURL.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = headers?.dictionary
        urlRequest.timeoutInterval = TimeInterval(30)
        if let params = parameters {
            urlRequest = try encoding.encode(urlRequest, with: params)
        }
        return urlRequest
    }
}

protocol APICall {
    var path: String { get }
    var method: String { get }
    var headers: [String: String]? { get }
    func body() throws -> Data?
}

enum APIError: Swift.Error {
    case invalidURL
    case httpCode(HTTPCode)
    case unexpectedResponse
    case imageDeserialization
}

extension APIError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL: return "URLが間違えています"
        case let .httpCode(code): return "予期せぬエラーレスポンス HTTP code: \(code)"
        case .unexpectedResponse: return "サーバーから予期せぬレスポンスが返ってきました"
        case .imageDeserialization: return "データから画像をデシリアライズできませんでした"
        }
    }
}

extension APICall {
    func urlRequest(baseURL: String) throws -> URLRequest {
        guard let url = URL(string: baseURL + path) else {
            throw APIError.invalidURL
        }
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.allHTTPHeaderFields = headers
        request.httpBody = try body()
        return request
    }
}

typealias HTTPCode = Int
typealias HTTPCodes = Range<HTTPCode>

extension HTTPCodes {
    static let success = 200 ..< 300
}
