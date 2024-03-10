//
//  DataStructuresApp.swift
//  DataStructures
//
//  Created by Mohit Kumar Singh on 10/03/24.
//

import SwiftUI

@main
struct DataStructuresApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
