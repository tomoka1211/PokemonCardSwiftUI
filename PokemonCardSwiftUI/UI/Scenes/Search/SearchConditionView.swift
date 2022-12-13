//
//  SearchConditionView.swift
//  PokemonCardSwiftUI
//
//  Created by hirano_tomoka on 2022/12/12.
//

import SwiftUI

struct SearchConditionView: View {
    @ObservedObject var viewModel: SearchConditionViewModel
    @Binding var isActive: Bool
    @State var isShowingPicker: Bool = false
    @State var selectedIndex: Int = 0
    
    @State var selectCardIndex: Int = 0
    var keyValues: [KeyValue] = [
        KeyValue(key: "11", value: "ドラゴン"),
        KeyValue(key: "22", value: "エスパー"),
        KeyValue(key: "33", value: "草"),
        KeyValue(key: "44", value: "炎"),
        KeyValue(key: "55", value: "ノーマル"),
        KeyValue(key: "66", value: "はがね"),
    ]
    
    var cardTypes: [KeyValue] = [
        KeyValue(key: "11", value: "ポケモン"),
        KeyValue(key: "22", value: "遊戯王")
    ]
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                ZStack{
                    VStack(alignment: .leading, spacing: 30) {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("ポケモンタイプ")
                                .font(.system(size: 18))
                                .fontWeight(.medium)
                            HStack {
                                Button(action: {
                                    print("Pickerに遷移")
                                    isShowingPicker = true
                                }) {
                                    VStack {
                                        HStack {
                                            Text("\(keyValues[selectedIndex].value)タイプ")
                                            Spacer().frame(width: 5)
                                            Image(systemName: "arrowtriangle.down")
                                        }
                                        .padding(EdgeInsets(top: 6, leading: 12, bottom: 6, trailing: 12))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 9)
                                                .stroke(.gray, lineWidth: 1)
                                        )
                                    }
                                }
                            }
                        }
                        VStack(alignment: .leading, spacing: 10) {
                            Text("カードタイプ")
                                .font(.system(size: 18))
                                .fontWeight(.medium)
                            SearchConditionRadioSelect(selectedIndex: $selectCardIndex, array: cardTypes)
                        }
                        Spacer()
                    }
                    .frame(
                        maxWidth: .infinity,
                        alignment: .topLeading
                    )
                    .padding(15)
                    VStack {
                        Spacer()
                        CustomPickerView(isActive: $isShowingPicker, selectedIndex: $selectedIndex, array: keyValues)
                            .animation(.easeOut, value: isShowingPicker)
                            .offset(y: isShowingPicker ? geometry.safeAreaInsets.bottom : CustomPickerView.viewHeight + geometry.safeAreaInsets.bottom)
                            .frame(height: CustomPickerView.viewHeight)
                            .ignoresSafeArea()
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("検索条件")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            isActive = false
                        }) {
                            Image(systemName: "xmark")
                        }
                    }
                }
            }
        }
        
    }
}

struct SearchConditionView_Previews: PreviewProvider {
    @State static var isActive = true
    static var previews: some View {
        SearchConditionView(viewModel: SearchConditionViewModel(searchCondition: SearchCondition(cardType: "pokemon", pokemonType: "エネルギー")), isActive: $isActive)
    }
}
