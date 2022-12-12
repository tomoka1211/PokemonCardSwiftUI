//
//  CardListResponse.swift
//  PokemonCardSwiftUI
//
//  Created by hirano_tomoka on 2022/12/12.
//

import Foundation

struct CardListResponse: Codable {
    var data: [Card]
    var page: Int
    var pageSize: Int
    var count: Int
    var totalCount: Int
}
