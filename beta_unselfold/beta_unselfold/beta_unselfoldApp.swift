//
//  beta_unselfoldApp.swift
//  beta_unselfold
//
//  Created by Cristi Cretu on 20.06.2021.
//

import SwiftUI

@main
struct beta_unselfoldApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
