//
//  ZamowieniaApp.swift
//  Zamowienia
//
//  Created by Kamil Kozioł on 09/04/2021.
//

import SwiftUI

@main
struct ZamowieniaApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
