//
//  CardRequest.swift
//  PokemonCardSwiftUI
//
//  Created by hirano_tomoka on 2022/12/12.
//

import Alamofire

enum CardRequest: BaseRequestProtocol {
    typealias ResponseType = CardListResponse

    case get

    var method: HTTPMethod {
        switch self {
        case .get: return .get
        }
    }

    var path: String {
        switch self {
        case .get:
            return "v2/cards"
        }
    }

    var parameters: Parameters? {
        switch self {
        case .get:
            return [
                "pageSize" : 10
            ]
        }
    }
}
