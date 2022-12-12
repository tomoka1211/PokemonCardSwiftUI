//
//  SearchConditionButtonView.swift
//  PokemonCardSwiftUI
//
//  Created by hirano_tomoka on 2022/12/12.
//

import SwiftUI

struct SearchConditionButtonView: View {
    var onTapSearchButton: (() -> Void)?
    
    var body: some View {
        Button(action: {
            onTapSearchButton?()
        }) {
            VStack{
                Text("検索条件")
                    .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.gray, lineWidth: 1)
                    )
            }
            .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
            .frame(height: 80)
        }
    }
}

extension SearchConditionButtonView {
    func onTapSearchButton(action: @escaping (() -> Void)) -> SearchConditionButtonView {
        SearchConditionButtonView(onTapSearchButton: action)
    }
}

struct SearchConditionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SearchConditionButtonView()
            .previewLayout(.fixed(width: 375, height: 80))
    }
}
