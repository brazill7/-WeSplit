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
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!!!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
