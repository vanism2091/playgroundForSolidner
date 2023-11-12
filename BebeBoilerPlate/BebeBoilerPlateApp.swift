//
//  BebeBoilerPlateApp.swift
//  BebeBoilerPlate
//
//  Created by sei on 10/23/23.
//

import SwiftUI
import SwiftData

@main
struct BebeBoilerPlateApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self, MealLog.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
//            MainView()
            AgreeView()
        }
        .modelContainer(sharedModelContainer)
    }
}
