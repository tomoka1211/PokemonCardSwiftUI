//
//  ImageView.swift
//  PokemonCardSwiftUI
//
//  Created by hirano_tomoka on 2022/12/12.
//

import SwiftUI

struct ImageView: View {
    @ObservedObject var viewModel: ImageViewModel
        var body: some View {
            Image(uiImage: viewModel.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(viewModel: .init(urlString: "https://images.pokemontcg.io/xy1/1.png"))
    }
}
