//
//  DatePickerView.swift
//  PokemonCardSwiftUI
//
//  Created by hirano_tomoka on 2022/12/13.
//

import SwiftUI

struct DatePickerView: View {
    @State private var date = Date.now

    var body: some View {
        // Picker ビミョい...
        // https://github.com/Jinxiansen/SwiftUI/blob/master/README.md#Picker
        VStack {
            Text("Enter your birthday")
                .font(.largeTitle)
            DatePicker("Enter your birthday", selection: $date, displayedComponents: [.date])
                .datePickerStyle(.wheel)
                .frame(maxHeight: 400)
                .environment(\.locale, Locale(identifier: "ja_JP"))
        }
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView()
    }
}
