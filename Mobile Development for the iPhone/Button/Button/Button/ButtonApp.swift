//
//  ButtonApp.swift
//  Button
//
//  Created by Taylor Shipley on 5/19/23.
//

import SwiftUI

@main
struct ButtonApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
