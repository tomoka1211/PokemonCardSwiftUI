//
//  CustomPickerView.swift
//  PokemonCardSwiftUI
//
//  Created by hirano_tomoka on 2022/12/13.
//

import SwiftUI

struct CustomPickerView: View {
    @Binding var isActive: Bool
    @Binding var selectedIndex: Int
    var array: [KeyValue]
    static let viewHeight: CGFloat = 253
    
    var body: some View {
        VStack {
            VStack {
                Rectangle().fill(Color(UIColor.systemGray4)).frame(height: 1)
                Spacer().frame(height: 10)
                Button(action: {
                    self.isActive = false
                }) {
                    HStack {
                        Spacer()
                        Text("完了")
                            .font(.headline)
                        Spacer().frame(width: 20)
                    }
                }
                Spacer().frame(height: 10)
            }
            .background(Color(UIColor.systemGray6))
            HStack(spacing: 0) {
                Picker("", selection: $selectedIndex) {
                    ForEach(array.indices, id: \.self) { index in
                        Text("\(array[index].value)")
                    }
                }
                .pickerStyle(.wheel)
                .labelsHidden()
            }.frame(maxWidth: .infinity).background(Color(UIColor.systemGray4))
            
        }
    }
}

struct CustomPickerView_Previews: PreviewProvider {
    @State static var isActive: Bool = true
    @State static var selectedIndex: Int = 0
    static var previews: some View {
        CustomPickerView(isActive: $isActive, selectedIndex: $selectedIndex, array: [KeyValue(key: "aaa", value: "doragon"), KeyValue(key: "bbb", value: "fairy"), KeyValue(key: "ccc", value: "normal")])
    }
}
