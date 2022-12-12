//
//  YearMonthPickerView.swift
//  PokemonCardSwiftUI
//
//  Created by hirano_tomoka on 2022/12/13.
//

import SwiftUI

struct YearMonthPickerView: View {
    static let viewHeight: CGFloat = 253
    
    private let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.usesGroupingSeparator = false
        return nf
    }()
    
    // 年のIndex
    @State private var selectedYearIndex: Int
    // 年の配列
    private let years: [Int]
    // 月のIndex
    @State private var selectedMonthIndex: Int
    // 月の配列
    private let months: [Int] = [1,2,3,4,5,6,7,8,9,10,11,12]
    
    @Binding var isShowing: Bool
    
    init(start: Int, end: Int, isShowing: Binding<Bool>) {
        let years = Array(start...end)
        self._selectedYearIndex = State(initialValue: years.startIndex)
        self.years = years
        self._selectedMonthIndex = State(initialValue: months.startIndex)
        self._isShowing = isShowing
    }
    
    func getElementsFromArray(at index: Int, array: [Int]) -> String {
        let selectedElements = array[index]
        return numberFormatter.string(for: selectedElements) ?? selectedElements.description
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                VStack {
                    Rectangle().fill(Color(UIColor.systemGray4)).frame(height: 1)
                    
                    Spacer().frame(height: 10)
                    
                    Button(action: {
                        self.isShowing = false
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
                
                // https://swiswiswift.com/2022-01-02/
                // タップ領域が重なる問題....
                HStack(spacing: 0) {
                    Picker("", selection: $selectedYearIndex) {
                        ForEach(years.indices, id: \.self) { index in
                            Text("\(self.getElementsFromArray(at: index, array: years))年")
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(width: geometry.size.width / 4)
                    .labelsHidden()
                    .compositingGroup()
                    .clipped()
                    Picker("", selection: $selectedMonthIndex) {
                        ForEach(months.indices, id: \.self) { index in
                            Text("\(self.getElementsFromArray(at: index, array: months))月")
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(width: geometry.size.width / 4)
                    
                    .labelsHidden()
                    .compositingGroup()
                    .clipped()
                }.frame(maxWidth: .infinity).background(Color(UIColor.systemGray4))
                
            }
        }
    }
}

struct YearMonthPickerView_Previews: PreviewProvider {
    @State static var isShowing: Bool = true
    static var previews: some View {
        YearMonthPickerView(start: 1900, end: 2020, isShowing: $isShowing)
    }
}
