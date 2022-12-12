//
//  Attack.swift
//  PokemonCardSwiftUI
//
//  Created by hirano_tomoka on 2022/12/12.
//

import Foundation

struct Attack: Codable, Hashable {
    var cost: [CardType]?
    var name: String
    var text: String?
    var damage: String?
    var convertedEnergyCost: Int
}
