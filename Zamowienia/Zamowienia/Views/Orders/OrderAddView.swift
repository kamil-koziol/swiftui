//
//  AddOrderView.swift
//  Zamowienia
//
//  Created by Kamil Kozioł on 10/04/2021.
//

import SwiftUI

struct OrderAddView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode
    
    @FetchRequest(entity: Order.entity(), sortDescriptors: [])
    private var orders: FetchedResults<Order>
    
    @State var addition1: Bool = false
    @State var addition2: Bool = false
    @State var addition3: Bool = false
    @State var amount: Int16 = 1
    @State var price: Double = 0
    @State var username: String = ""
    @State var date: Date = Date()
    
    
    var body: some View {
            Form {
                Section(header: Text("Personal Info")) {
                    TextField("Username", text: $username)
                }
                
                Section(header: Text("Additional info")) {
                    Stepper("Amount: \(amount)", value: $amount, in: 1...99, onEditingChanged: {_ in
                        calculatePrice()
                    })
                        .padding(.vertical)
                }
                Section(header: Text("Additions")) {
                    Toggle(isOn: $addition1, label: {
                        Text("Addition 1")
                    }).onChange(of: addition1, perform: { value in
                        calculatePrice()
                    })
                    
                    
                    Toggle(isOn: $addition2, label: {
                        Text("Addition 2")
                    }).onChange(of: addition2, perform: { value in
                        calculatePrice()
                    })
                    
                    Toggle(isOn: $addition3, label: {
                        Text("Addition 3")
                    }).onChange(of: addition3, perform: { value in
                        calculatePrice()
                    })
                }
                
                Section(header: Text("Summary")) {
                    DatePicker("Date", selection: $date, displayedComponents: [.date]).padding(.vertical)
                    Text("Price: \(String(format: "%.2f", price)) zł")
                }
                
                Button(action: {
                    calculatePrice()
                    
                    let order = Order(context: viewContext)
                    order.addition1 = addition1
                    order.addition2 = addition2
                    order.addition3 = addition3
                    order.amount = amount
                    order.date = date
                    order.price = price
                    order.username = username
                    
                    do {
                        try self.viewContext.save()
                    } catch {
                        print(error)
                    }
                    
                    resetValues()
                    calculatePrice()
                    self.presentationMode.wrappedValue.dismiss()
                    
                }, label: {
                    Text("Confirm")
                })
            }
            .navigationTitle("Add order")
            .onAppear(perform: {
                calculatePrice()
            })
    }
    
    func resetValues() {
        addition1 = false
        addition2 = false
        addition3 = false
        amount = 1
        price = 0
        username = ""
        date = Date()
    }
    
    func calculatePrice() {
        var additionPrices: Int = 0;
        additionPrices += (addition1 ? 1:0)
        additionPrices += (addition2 ? 2:0)
        additionPrices += (addition3 ? 3:0)
        price = Double(Int(amount) * (additionPrices + 5))
    }
}

struct OrderAddView_Previews: PreviewProvider {
    static var previews: some View {
        OrderAddView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
