//
//  SearchView.swift
//  PokemonCardSwiftUI
//
//  Created by hirano_tomoka on 2022/12/12.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel: SearchViewModel
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.cardList, id: \.hashValue) { card in
                            SearchCardRow(card: card)
                        }
                    }
                }
                .navigationTitle("検索")
            }
        }
        .onAppear {
            viewModel.getCardList()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: .init())
    }
}
