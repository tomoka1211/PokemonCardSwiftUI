//
//  SubType.swift
//  PokemonCardSwiftUI
//
//  Created by hirano_tomoka on 2022/12/12.
//

import Foundation

enum SubType: String, Codable, Hashable {
    case EX = "EX"
    case SPECIAL = "Special"
    case RESTORED = "Restored"
    case LEVEL_UP = "Level Up"
    case MEGA = "MEGA"
    case TECHNICAL_MACHINE = "Technical Machine"
    case ITEM = "Item"
    case STADIUM = "Stadium"
    case SUPPORTER = "Supporter"
    case STAGE_1 = "Stage 1"
    case STAGE_2 = "Stage 2"
    case GX = "GX"
    case POKEMON_TOOL = "Pokémon Tool"
    case BASIC = "Basic"
    case LEGEND = "LEGEND"
    case BREAK = "BREAK"
    case ROCKETS_SECRET_MACHINE = "Rocket's Secret Machine"
    case TAG_TEAM = "TAG TEAM"
    case V = "V"
    case VMAX = "VMAX"
    case UNKNOWN
}
