//
//  ContentView.swift
//  WeSplit (100 Days of SwiftUI)
//
//  Created by Maverick Brazill on 7/18/23.
//

import SwiftUI

struct ContentView: View {
    @State var numOfPeople = 1
    @State var tipPercentage = 20
    @State var billTotal = 0.0
    
    var billPlusTip: Double{
        let people = Double(numOfPeople)
        let tip = Double(tipPercentage)
        
        let tipValue = billTotal / 100 * tip
        let grandTotal = billTotal + tipValue
        
        return grandTotal
    }
    
    var totalPerPerson: Double{

        let amountPerPerson = billPlusTip / Double(numOfPeople)
    
        return amountPerPerson
    }
    
    
    ///text field variables
    @FocusState var focused
    @State var submitted = false
    ///
    var body: some View {
        NavigationView{
            VStack {
                Form{
                    Section{
                        HStack{
                            Text("Check Amount: ")
                            TextField("Amount", value: $billTotal, format: .currency(code: "USD"))
                                .focused($focused)
                                .onSubmit {
                                    submitted = true
                                }
                                .foregroundColor(((submitted && !focused) ? .black : .gray))
                                .multilineTextAlignment(.trailing)
                        }
                    }
                    Section{
                        Picker("Number of People:", selection: $numOfPeople){
                            ForEach(1...20, id:\.self){ people in
                                Text("\(people)")
     
                            }
                        }
                    }
                    Section{
                        Picker("Tip Percent:", selection: $tipPercentage){
                            ForEach(20...100, id: \.self){ number in
                                Text("\(number)%")
                            }
                        }
                    }
                    Section{
                        VStack(alignment: .trailing){
                            Text("Each Person Owes: \(totalPerPerson.formatted(.currency(code: "USD")))")
                            Divider()
                            Text("Total Including Tip: \(billPlusTip.formatted(.currency(code: "USD")))")
                                .font(.system(size: 12))
                                .multilineTextAlignment(.trailing)

                        }.frame(minWidth: 50)
                    }
                }
            }.toolbar{
                ToolbarItem(placement: .principal){
                    Text("Check + Tip Calculator")
                        .multilineTextAlignment(.center)
                }
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
