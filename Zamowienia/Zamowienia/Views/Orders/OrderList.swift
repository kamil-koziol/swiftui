//
//  OrderList.swift
//  Zamowienia
//
//  Created by Kamil Kozioł on 10/04/2021.
//

import SwiftUI

struct OrderList: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Order.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Order.date, ascending: true),
    ])
    private var orders: FetchedResults<Order>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(orders) {order in
                    NavigationLink(destination: OrderView(order: order)) {
                        OrderListRow(order: order);
                    }
                }.onDelete(perform: { indexSet in
                    let deleteItem = self.orders[indexSet.first!]
                    viewContext.delete(deleteItem)
                    
                    do {
                        try viewContext.save()
                    } catch {
                        print(error)
                    }
                })
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Orders")
            .navigationBarItems(leading: EditButton(), trailing: Button(action: {
            }, label: {
                NavigationLink(destination: OrderAddView()) {
                    Image(systemName: "plus.circle.fill")
                        .imageScale(.large)
                        .foregroundColor(.green)
                }
            }))
        }
    }
}

struct OrderList_Previews: PreviewProvider {
    static var previews: some View {
        OrderList().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
