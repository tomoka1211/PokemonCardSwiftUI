//
//  APIManager.swift
//  PokemonCardSwiftUI
//
//  Created by hirano_tomoka on 2022/12/12.
//

import Alamofire
import Foundation
import Combine

struct APIManager {
    
    // MARK: - Property
    
    private let manager: Session = {
        let sessionManager = Alamofire.Session(configuration: URLSessionConfiguration.default)
        return sessionManager
    }()
    
    // MARK: - Public
    
    func call<T, V>(_ request: T) -> AnyPublisher<V, AFError> where T: BaseRequestProtocol, V == T.ResponseType, T.ResponseType: Codable {
        let task = AF.request(request)
        task.responseData { response in
            print(task.cURLDescription())
        }
        return task
            .validate(statusCode: HTTPCodes.success)
            .validate(contentType: ["application/json"])
            .publishDecodable(type: V.self, decoder: JSONDecoder())
            .value()
    }
}

