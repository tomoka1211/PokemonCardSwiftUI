//
//  SearchViewModel.swift
//  PokemonCardSwiftUI
//
//  Created by hirano_tomoka on 2022/12/12.
//

import Foundation
import Combine

final class SearchViewModel: ObservableObject {
    @Published var cardList = [Card]()
    
    var cancellables = Set<AnyCancellable>()
    var repository = CardRepository()
    
    deinit {
        cancellables.forEach { (cancelable) in
            cancelable.cancel()
        }
    }
    
    func getCardList() {
        repository.get()
            .sink(
                receiveCompletion: { error in
                    print(error)
                },
                receiveValue: { [weak self] result in
                    print(result)
                    guard let self = self else { return }
                    self.cardList = result.data
                }
            )
            .store(in: &cancellables)
    }
}
