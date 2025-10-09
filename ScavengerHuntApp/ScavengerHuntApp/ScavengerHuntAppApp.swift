//
//  ScavengerHuntAppApp.swift
//  ScavengerHuntApp
//
//  Created by Abdulmohammad BAIG on 2025-10-04.
//

import SwiftUI

@main
struct ScavengerHuntAppApp: App {
    @StateObject private var vm = HuntViewModel()  // ✅ create view model once

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)  // ✅ inject into ContentView
        }
    }
}
