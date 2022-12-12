//
//  Card.swift
//  PokemonCardSwiftUI
//
//  Created by hirano_tomoka on 2022/12/12.
//

import Foundation

struct Card: Codable, Hashable {
    var id: String
    var name: String
    var nationalPokedexNumbers: [Int]?
    var images: ImageSize
    var supertype: SuperType
    var subtypes: [String]
    var hp: String?
    var types: [CardType]
    var evolvesTo: [String]?
    var rules: [String]?
    var attacks: [Attack]?
    var weaknesses: [Effect]?
    var retreatCost: [CardType]?
    var convertedRetreatCost: Int?
    var number: String
    var artist: String?
    var rarity: String?
}

