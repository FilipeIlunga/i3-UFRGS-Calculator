//
//  ContentView.swift
//  i3-Calculator
//
//  Created by Filipe Ilunga on 24/05/23.
//

import SwiftUI


struct PickerNota: View {
    @Binding var num: Int
     var label: String
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
            Picker("\(num)", selection: $num) {
                ForEach(0..<50) { num in
                    Text("\(num)")
                        .tag(num)
                }
            }.pickerStyle(.wheel)
                .cornerRadius(10)
        }
    }
}


struct ContentView: View {
    
    @State var nome: String = ""
    
    @State var numAs = 5
    @State var numBs = 5
    @State var numCs = 5
    @State var numDs = 5
    @State var numFFs = 5
    @State var numCancelados = 5
    @State var i3: Double = 0.0
    
    var body: some View {
        
        VStack {
            
            Text("I3: \(String(format: "%.2f",i3))")
            HStack {
                PickerNota(num: $numAs, label: "As")
                    .onChange(of: numAs) { _ in
                        calcula()
                    }
                PickerNota(num: $numBs, label: "Bs")
                    .onChange(of: numBs) { _ in
                        calcula()
                    }
                PickerNota(num: $numCs, label: "Cs")
                    .onChange(of: numCs) { _ in
                        calcula()
                    }
                PickerNota(num: $numDs, label: "Ds")
                    .onChange(of: numDs) { _ in
                        calcula()
                    }
                PickerNota(num: $numFFs, label: "FFs")
                    .onChange(of: numFFs) { _ in
                        calcula()
                    }
                PickerNota(num: $numCancelados, label: "Cancel")
                    .onChange(of: numCancelados) { _ in
                        calcula()
                    }
            }
            
        }
        .padding()
    }
    
    func calculaI3(numAs: Int, numBs: Int, numCs: Int, numDs: Int, numFFs: Int, numCancelado: Int) -> Double{
        
        let numerador: Int = numFFs + numCancelado + numDs + numBs + numAs + numCs
        
        let denominador: Double = Double(numFFs) + 0.5*Double(numCancelado) + (1/3)*Double(numDs) + (1/6)*Double(numCs) + (1/8)*Double(numBs) + (1/10)*Double(numAs)
        
        let i3:Double = Double(numerador)/denominador
        return i3
    }
    
    func calcula(){
        
        let numA = numAs
        let numB = numBs
        let numC = numCs
        let numD = numDs
        let numFF = numFFs
        let numCancelado = numCancelados
        
        let numerador: Int = numA + numB + numC + numD + numFF + numCancelado
        
        let denominador: Double = Double(numFF) + 0.5*Double(numCancelado) + (1/3)*Double(numD) + (1/6)*Double(numC) + (1/8)*Double(numB) + (1/10)*Double(numA)
        
        i3 = Double(numerador)/denominador
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
