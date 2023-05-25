//
//  ContentView.swift
//  i3-Calculator
//
//  Created by Filipe Ilunga on 24/05/23.
//

import SwiftUI


struct ContentView: View {
    
    @State var nome: String = ""
    
    @State var numAs = 0
    @State var numBs = 0
    @State var numCs = 0
    @State var numDs = 0
    @State var numFFs = 0
    @State var numCancelados = 0
    @State var i3: Double = 0.0
    
    var body: some View {
        VStack {
            ZStack{
                Rectangle()
                    .fill(.red)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.1, alignment: .center)
                Text("Calculadora do I3")
                    .frame(alignment: .bottom)
                    .offset(y: 23)
                HStack{
                    Spacer()
                    Image("UfrgsLogo")
                        .resizable()
                        .frame(width: 60, height: 60, alignment: .bottom)
                        .offset(x: -15, y: 15)
                }
            }
            HStack{
                Text("I3: ")
                    .font(.title)
                    .padding(.vertical, 20)
                ZStack{
                    Rectangle()
                        .fill(.red)
                        .frame(width: UIScreen.main.bounds.width*0.2, height: UIScreen.main.bounds.height*0.05, alignment: .center)
                    Text("\(String(format: "%.2f",i3))")
                        .font(.title)
                }
                .padding(.vertical, 20)
                
            }
            Text("Selecione o número de notas:")
                .padding(.horizontal)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width/5, alignment: .topLeading)
                .minimumScaleFactor(0.80)
                .lineLimit(1)
                .font(.headline)
            HStack(spacing: 20) {
                PickerNota(num: $numAs, label: "As\n")
                    .onChange(of: numAs) { _ in
                        calcula()
                    }
                PickerNota(num: $numBs, label: "Bs\n")
                    .onChange(of: numBs) { _ in
                        calcula()
                    }
                PickerNota(num: $numCs, label: "Cs\n")
                    .onChange(of: numCs) { _ in
                        calcula()
                    }
            }
            HStack{
                PickerNota(num: $numDs, label: "Ds\n")
                    .onChange(of: numDs) { _ in
                        calcula()
                    }
                PickerNota(num: $numFFs, label: "FFs\n")
                    .onChange(of: numFFs) { _ in
                        calcula()
                    }
                PickerNota(num: $numCancelados, label: "Canc\nTranc")
                    .minimumScaleFactor(0.8)
                    .lineLimit(2)
                    .onChange(of: numCancelados) { _ in
                        calcula()
                    }
            }
            Spacer()
        }.ignoresSafeArea()
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
