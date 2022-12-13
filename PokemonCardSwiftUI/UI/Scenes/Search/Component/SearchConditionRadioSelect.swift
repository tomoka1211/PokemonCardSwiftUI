//
//  SearchConditionRadioSelect.swift
//  PokemonCardSwiftUI
//
//  Created by hirano_tomoka on 2022/12/14.
//

import SwiftUI

struct SearchConditionRadioSelect: View {
    @Binding var selectedIndex: Int
    var array: [KeyValue]
    
    var body: some View {
        HStack {
            ForEach(0..<array.count, id: \.self) { index in
                HStack {
                    Image(systemName: selectedIndex == index ? "circle.inset.filled" : "circle")
                        .foregroundColor(.orange)
                    Spacer().frame(width: 10)
                    Text(array[index].value)
                        .font(.system(size: 18))
                }
                .onTapGesture {
                    selectedIndex = index
                }
            }
            Spacer()
        }
    }
}

struct SearchConditionRadioSelect_Previews: PreviewProvider {
    @State static var selectedIndex: Int = 0
    static var previews: some View {
        SearchConditionRadioSelect(selectedIndex: $selectedIndex, array: [KeyValue(key: "pok", value: "ポケモン"), KeyValue(key: "yug", value: "遊戯王")])
    }
}
