//
//  PickerView.swift
//  i3-Calculator
//
//  Created by Thiago Parisotto on 24/05/23.
//

import SwiftUI


struct PickerNota: View {
    @Binding var num: Int
    var label: String
    var body: some View {
        VStack(alignment: .center) {
            Text(label)
                .padding(.bottom, -10)
                .padding(.horizontal, 5)
                .font(.headline)
            Picker("\(num)", selection: $num) {
                ForEach(0..<50) { num in
                    Text("\(num)")
                        .tag(num)
                }
            }.pickerStyle(.wheel)
                .cornerRadius(10)
                .frame(height: 100)
                .padding(.bottom, 20)
        }
    }
    
}
