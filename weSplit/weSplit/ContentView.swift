//
//  ContentView.swift
//  weSplit
//
//  Created by jestin antony on 29/05/20.
//  Copyright © 2020 jestin antony. All rights reserved.
//

import SwiftUI

struct ContentView: View {
@State private var Amount = ""
@State private var Peoples = ""
@State private var tip = 0
    
    var tipArray = [10,20,30,40]

    var grandAmount: Double{
        let totalAmount = Double(Amount) ?? 0
        let tipSelection = Double(tipArray[tip])
        let tipAmount = totalAmount / 100 * tipSelection
        let grandAmount = totalAmount+tipAmount
        
        return grandAmount
                          }
    
    var totalPerPerson:Double {
        let peopleCount = Double(Peoples) ?? 1
        let totalPerPerson = grandAmount / peopleCount
        
        return totalPerPerson
                             }

var body: some View {
    NavigationView {
        Form{
            Section{
                TextField("Amount",text: $Amount)
                    .keyboardType(.decimalPad)
 
                TextField("Number of peoples",text: $Peoples)
                    .keyboardType(.numberPad)
                  }
            
            Section(header: Text("How much tip do you want to leave")){
                 Picker("tip is ",selection: $tip){
                     ForEach(0..<tipArray.count){
                         Text("\(self.tipArray[$0])%")
                        
                     }
                 }.pickerStyle(SegmentedPickerStyle())
             }
            Section(header: Text("Total amount")){
                 Text("$\(grandAmount,specifier: "%.2f")")
            }
            Section(header: Text("Total per person")){
                 Text("$\(totalPerPerson,specifier: "%.2f")")
                       }
            
        }
        .navigationBarTitle("We Split")
      }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDisplayName("iphone 8")
    }
}

