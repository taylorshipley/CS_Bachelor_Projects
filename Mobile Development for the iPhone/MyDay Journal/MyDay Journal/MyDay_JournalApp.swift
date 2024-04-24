//
//  MyDay_JournalApp.swift
//  MyDay Journal
//
//  Created by Taylor Shipley on 8/1/23.
//

import SwiftUI

@main
struct MyDay_JournalApp: App {
    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool = true
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    if isFirstLaunch {
                        NotificationManager.shared.requestNotificationAuthorization()
                        isFirstLaunch = false // set to false so that this block doesn't get executed again
                    }
                }
        }
    }
}

