//
//  ContentView.swift
//  i3-Calculator
//
//  Created by Filipe Ilunga on 24/05/23.
//

import SwiftUI



struct ContentView: View {
    
    @State var nome: String = ""
    
    @AppStorage("numAs") private var numAs = 0
    @AppStorage("numBs") private var numBs = 0
    @AppStorage("numCs") private var numCs = 0
    @AppStorage("numDs") private var numDs = 0
    @AppStorage("numFs") private var numFFs = 0
    @AppStorage("numCancs") private var numCancelados = 0
    @State private var i3: Double = 0.0
    @State private var color: Color = .red
    
    var body: some View {
        VStack {
            ZStack{
                Rectangle()
                    .fill(.red)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.12, alignment: .center)
                Text("Calculadora I3")
                    .frame(alignment: .bottom)
                    .offset(y: 25)
                    .font(.title)
                HStack{
                    Spacer()
                    Image("ufrgslogo 1")
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .bottom)
                        .offset(x: -20, y: 25)
                }
            }
            HStack{
                Text("I3: ")
                    .font(.title)
                    .bold()
                    .padding(.vertical, 20)
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(color)
                        .frame(width: UIScreen.main.bounds.width*0.3, height: UIScreen.main.bounds.height*0.05, alignment: .center)
                    Text("\(String(format: "%.4f",i3))")
                        .font(.title)
                        .bold()
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
        }
        .onChange(of: i3, perform: { _ in
            if(i3 >= 9){
                color = .green
            }
            else{
                if(i3 >= 7.5){
                    color = .blue
                }
                else{
                    if(i3 >= 6){
                        color = .orange
                    }
                    else{
                        color = .red
                    }
                }
            }
        })
        .onAppear(perform: {
            calcula()
        })
        .ignoresSafeArea()
    }
    
    
//    func calculaI3(numAs: Int, numBs: Int, numCs: Int, numDs: Int, numFFs: Int, numCancelado: Int) -> Double{
//        
//        let numerador: Int = numFFs + numCancelado + numDs + numBs + numAs + numCs
//        
//        let denominador: Double = Double(numFFs) + 0.5*Double(numCancelado) + (1/3)*Double(numDs) + (1/6)*Double(numCs) + (1/8)*Double(numBs) + (1/10)*Double(numAs)
//        
//        let i3:Double = Double(numerador)/denominador
//        return i3
//    }
    
    func calcula(){
        
        let numA = numAs
        let numB = numBs
        let numC = numCs
        let numD = numDs
        let numFF = numFFs
        let numCancelado = numCancelados
        
        let numerador: Int = numA + numB + numC + numD + numFF + numCancelado
        
        let denominador: Double = Double(numFF) + 0.5*Double(numCancelado) + (1/3)*Double(numD) + (1/6)*Double(numC) + (1/8)*Double(numB) + (1/10)*Double(numA)
        if(denominador == 0) {
            i3 = 0
        }
        else {
            i3 = Double(numerador)/denominador
        }
    }
    
}
