//
//  InventoryApp.swift
//  Inventory
//
//  Created by Taylor Shipley on 6/30/23.
//

import SwiftUI

@main
struct InventoryApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Call createTable when the application starts
        DBManager.shared.createTable()
        return true
    }
}
