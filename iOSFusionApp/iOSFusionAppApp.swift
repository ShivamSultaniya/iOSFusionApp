//
//  iOSFusionAppApp.swift
//  iOSFusionApp
//
//  Created by Shivam Sultaniya on 07/09/24.
//

import SwiftUI
import SwiftData

@main
struct iOSFusionAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [OwnedCryptos.self])
    }
}
