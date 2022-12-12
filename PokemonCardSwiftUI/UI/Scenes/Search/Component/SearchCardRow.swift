//
//  SearchCardRow.swift
//  PokemonCardSwiftUI
//
//  Created by hirano_tomoka on 2022/12/12.
//

import SwiftUI

struct SearchCardRow: View {
    var card: Card
    var body: some View {
        VStack {
            HStack {
                ImageView(viewModel: .init(urlString: card.images.small))
                    .frame(height: 150)
                Spacer()
                    .frame(width: 16)
                VStack {
                    Spacer()
                    Text("名前: \(card.name)")
                    Text("HP: \(card.hp ?? "0")")
                    Text("レア度: \(card.rarity ?? "")")
                    Spacer()
                }
            }
            Spacer()
            Divider()
        }
        .padding(16)
    }
}

struct SearchCardRow_Previews: PreviewProvider {
    static var previews: some View {
        SearchCardRow(card: Card(id: "aa", name: "aa", images: ImageSize(small: "", large: ""), supertype: SuperType.POKEMON, subtypes: ["subtypes"], types: [CardType.DRAGON], number: "827"))
    }
}
