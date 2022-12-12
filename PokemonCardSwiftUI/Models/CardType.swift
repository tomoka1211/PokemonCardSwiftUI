//
//  CardType.swift
//  PokemonCardSwiftUI
//
//  Created by hirano_tomoka on 2022/12/12.
//

import Foundation

enum CardType: String, Codable, Hashable {
    case COLORLESS = "Colorless"
    case DARKNESS = "Darkness"
    case DRAGON = "Dragon"
    case FAIRY = "Fairy"
    case FIGHTING = "Fighting"
    case FIRE = "Fire"
    case GRASS = "Grass"
    case LIGHTNING = "Lightning"
    case METAL = "Metal"
    case PSYCHIC = "Psychic"
    case WATER = "Water"
    case UNKNOWN
}
