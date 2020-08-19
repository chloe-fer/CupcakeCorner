//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Chloe Fermanis on 17/8/20.
//  Copyright © 2020 Chloe Fermanis. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var order = Order()

    var body: some View {

        NavigationView {
            
            Form {
                
                Section(header: Text("Cakes")) {
                    
                    Picker("Select your cake type", selection: $order.type) {
                        ForEach(0..<Order.types.count, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }

                    Stepper(value: $order.quantity, in: 3...20) {
                        Text("Number of cakes: \(order.quantity)")
                    }
                    .padding(.top)
                }
                
                Section(header: Text("Extras")) {
                    Toggle(isOn: $order.specialRequestEnabled.animation()) {
                        Text("Any special requests?")
                    }

                    if order.specialRequestEnabled {
                        Toggle(isOn: $order.extraFrosting) {
                            Text("Add extra frosting")
                        }

                        Toggle(isOn: $order.addSprinkles) {
                            Text("Add extra sprinkles")
                        }
                    }
                }
                
                Section(header: Text("Delivery")) {
                    NavigationLink(destination: AddressView(order: order)) {
                        Text("Delivery Details")
                    }
                }
            }
            .navigationBarTitle("Cupcake Corner", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
