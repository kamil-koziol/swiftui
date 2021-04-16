//
//  OrderView.swift
//  Zamowienia
//
//  Created by Kamil Kozioł on 10/04/2021.
//

import SwiftUI

struct OrderView: View {
    
    var order: Order
    
    var body: some View {
        Form {
            Section(header: Text("Personal Info")) {
                TextField("Username", text: Binding.constant(order.username))
                    .disabled(true)
            }
            
            Section(header: Text("Additional info")) {
                Text("Amount: \(order.amount)")
            }
            Section(header: Text("Additions")) {
                Toggle(isOn: Binding.constant(order.addition1), label: {
                    Text("Addition 1")
                }).disabled(true)
                
                
                Toggle(isOn: Binding.constant(order.addition2), label: {
                    Text("Addition 2")
                }).disabled(true)
                
                Toggle(isOn: Binding.constant(order.addition3), label: {
                    Text("Addition 3")
                }).disabled(true)
            }
            
            Section(header: Text("Summary")) {
                DatePicker("Date", selection: Binding.constant(order.date), displayedComponents: [.date])
                    .padding(.vertical)
                    .disabled(true)
                Text("Price: \(String(format: "%.2f", order.price)) zł")
            }
        }.navigationTitle("Order")
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext

        let order = Order(context: context)
        order.username = "Kamil"
        order.amount = 2
        order.price = 20.0
        order.date = Date()
        order.addition1 = false;
        order.addition2 = true;
        order.addition3 = false;
        
        return OrderView(order: order)
    }
}
