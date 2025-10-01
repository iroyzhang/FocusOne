//
//  FocusOneApp.swift
//  FocusOne
//
//  Created by Roy Zhang on 2025/10/1.
//

import SwiftUI
import SwiftData

@main
struct FocusOneApp: App {
    var body: some Scene {
#if os(macOS)
        MenuBarExtra("OneThing", systemImage: "hourglass") {
            FocusItemCreationWindow()
        }
        .menuBarExtraStyle(.window)
#endif
#if os(iOS)
        EmptyView()
#endif
    }
}
