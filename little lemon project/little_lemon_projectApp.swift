//
//  little_lemon_projectApp.swift
//  little lemon project
//
//  Created by Samantha Toinga on 12/9/25.
//

import SwiftUI

@main
struct little_lemon_projectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
