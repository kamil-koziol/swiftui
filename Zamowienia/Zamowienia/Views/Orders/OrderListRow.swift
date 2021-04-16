//
//  OrderListRow.swift
//  Zamowienia
//
//  Created by Kamil Kozioł on 10/04/2021.
//

import SwiftUI

struct OrderListRow: View {
    
    var order: Order
    
    var body: some View {
            VStack(alignment: .leading) {
                Text("\(order.username)")
                Text("\(formatDate(date: order.date))")
                    .font(/*@START_MENU_TOKEN@*/.footnote/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color.gray)
            }
    }
    
    func formatDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: date)
    }
}

struct OrderListRow_Previews: PreviewProvider {
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
        
        return OrderListRow(order: order)
    }
}
