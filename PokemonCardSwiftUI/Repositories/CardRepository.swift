//
//  CardRepository.swift
//  PokemonCardSwiftUI
//
//  Created by hirano_tomoka on 2022/12/12.
//

import Alamofire
import Combine

struct CardRepository {

    // MARK: - Public

    func get() -> AnyPublisher<CardListResponse, AFError> {
        let request = CardRequest.get
        return APIManager().call(request)
    }
}
