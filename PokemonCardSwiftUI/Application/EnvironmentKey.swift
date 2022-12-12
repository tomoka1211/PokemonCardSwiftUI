//
//  EnvironmentKey.swift
//  PokemonCardSwiftUI
//
//  Created by hirano_tomoka on 2022/12/12.
//

import Foundation

struct EnvironmentKey {
    // MARK: - アクセスするためには、APIKeyが必要になります
    static let apiKey: String = SecretEnv.apiKey
    
    static let rootUrl = "https://api.pokemontcg.io"
}
