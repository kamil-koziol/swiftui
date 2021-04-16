//
//  Order+CoreDataProperties.swift
//  Zamowienia
//
//  Created by Kamil Kozioł on 15/04/2021.
//
//

import Foundation
import CoreData


extension Order {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Order> {
        return NSFetchRequest<Order>(entityName: "Order")
    }

    @NSManaged public var username: String
    @NSManaged public var amount: Int16
    @NSManaged public var price: Double
    @NSManaged public var date: Date
    @NSManaged public var addition1: Bool
    @NSManaged public var addition2: Bool
    @NSManaged public var addition3: Bool

}

extension Order : Identifiable {

}
