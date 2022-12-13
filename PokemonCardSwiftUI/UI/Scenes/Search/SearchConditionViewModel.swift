//
//  SearchConditionViewModel.swift
//  PokemonCardSwiftUI
//
//  Created by hirano_tomoka on 2022/12/14.
//

import Foundation
import Combine

final class SearchConditionViewModel: ObservableObject {
    @Published var searchCondition: SearchCondition
    @Published var cardType: Int
    @Published var pokemonType: Int
    
    var cancellables = Set<AnyCancellable>()
    var repository = CardRepository()
    
    init(searchCondition: SearchCondition) {
        _searchCondition = .init(initialValue: searchCondition)
        _cardType = .init(initialValue: searchCondition.cardType)
        _pokemonType = .init(initialValue: searchCondition.pokemonType)
        Publishers.CombineLatest($cardType, $pokemonType)
            .map { SearchCondition(cardType: $0, pokemonType: $1) }
            .assign(to: \.searchCondition, on: self)
            .store(in: &cancellables)
    }
    
    deinit {
        cancellables.forEach { (cancelable) in
            cancelable.cancel()
        }
    }
    
    func getCardList() {
    }
}
