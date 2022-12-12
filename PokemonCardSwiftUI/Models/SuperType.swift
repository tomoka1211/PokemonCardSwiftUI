//
//  SuperType.swift
//  PokemonCardSwiftUI
//
//  Created by hirano_tomoka on 2022/12/12.
//

import Foundation

enum SuperType: String, Codable, Hashable {
    case ENERGY = "Energy"
    case POKEMON = "Pokémon"
    case TRAINER = "Trainer"
    case UNKNOWN
}
