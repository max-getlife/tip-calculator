//
//  ContentView.swift
//  Netflix Clone
//
//  Created by Maksym Getlife on 29.05.2022.
//

import SwiftUI
import Foundation



struct ContentView: View {
    @State private var check = ""
    @State private var guests = 2
    let currency = ["UAN", "USD", "EUR"]
    @State private var currencyBar = 0
    @State private var percantage = 0
    let percantages = [3, 5, 10, 15]
    
    var totalPerPerson: Double {
        let peopleCount = Double(guests + 2)
        let typePerсantage = Double(percantages[percantage])
        let checkAmount = Double(check) ?? 0
        let aaa = checkAmount / 100 * typePerсantage
        let bbb = checkAmount + aaa
        let ccc = bbb / peopleCount
      return ccc
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Данные чека"), content: {
                    TextField("Введите сумму чека", text: $check)
                    Picker("Валюта чека", selection: $currencyBar) {
                        ForEach(0..<currency.count) {
                            Text(self.currency[$0])
                        }
                    } .pickerStyle(SegmentedPickerStyle())
                    Picker("Количество гостей", selection: $guests) {
                        ForEach(2..<20) {
                            Text("\($0) гостей")
                        }
                    }
                    
                    
                })
                
                Section(header: Text("Выберите процент чаевых"), content: {
                    Picker("Процент чаевых",selection: $percantage) {
                        ForEach(0..<percantages.count) {
                            Text("\(self.percantages[$0]) %")
                        }
                    }
                }) .pickerStyle(SegmentedPickerStyle())
                        
                Section(header: Text("Вы должны заплатить, с учетом чаевых:"), content: {
                    Text("\(totalPerPerson, specifier: "%.2f") \(currency[currencyBar]) с каждого")
                })
                            
            } .navigationTitle("Калькулятор чаевых")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
}



