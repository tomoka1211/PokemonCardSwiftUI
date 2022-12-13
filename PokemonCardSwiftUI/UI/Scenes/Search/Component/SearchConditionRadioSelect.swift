//
//  SearchConditionRadioSelect.swift
//  PokemonCardSwiftUI
//
//  Created by hirano_tomoka on 2022/12/14.
//

import SwiftUI

struct SearchConditionRadioSelect: View {
    @Binding var selectedKey: Int
    var array: [KeyValue]
    
    var body: some View {
        HStack {
            ForEach(0..<array.count, id: \.self) { index in
                HStack {
                    Image(systemName: array.firstIndex { $0.key == selectedKey } ?? -1 == index ? "circle.inset.filled" : "circle")
                        .foregroundColor(.orange)
                    Spacer().frame(width: 10)
                    Text(array[index].value)
                        .font(.system(size: 18))
                }
                .onTapGesture {
                    selectedKey = array[index].key
                }
            }
            Spacer()
        }
    }
}

struct SearchConditionRadioSelect_Previews: PreviewProvider {
    @State static var selectedKey: Int = 0
    static var previews: some View {
        SearchConditionRadioSelect(selectedKey: $selectedKey, array: [KeyValue(key: 1, value: "ポケモン"), KeyValue(key: 2, value: "遊戯王")])
    }
}
