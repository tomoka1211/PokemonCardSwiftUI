//
//  SearchConditionView.swift
//  PokemonCardSwiftUI
//
//  Created by hirano_tomoka on 2022/12/12.
//

import SwiftUI

struct SearchConditionView: View {
    @Binding var isActive: Bool
    @State var isShowingPicker: Bool = false
    var body: some View {
        GeometryReader { geometry in
        NavigationView {
            ZStack{
            VStack(alignment: .leading, spacing: 0) {
                Text("年月")
                HStack {
                    Button(action: {
                        print("Pickerに遷移")
                        isShowingPicker = true
                    }) {
                        VStack {
                            HStack {
                                Text("2020")
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
                Spacer()
            }
            .frame(
                maxWidth: .infinity,
                alignment: .topLeading
            )
            .padding(15)
                VStack {
                    Spacer()
                    
                    YearMonthPickerView(start: 1900, end: 2200, isShowing: $isShowingPicker)
                    .animation(.easeOut)
                    .offset(y: isShowingPicker ? geometry.safeAreaInsets.bottom : YearMonthPickerView.viewHeight + geometry.safeAreaInsets.bottom)
                    .frame(height: YearMonthPickerView.viewHeight)
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
        SearchConditionView(isActive: $isActive)
    }
}
