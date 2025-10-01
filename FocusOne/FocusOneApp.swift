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
    
    @StateObject private var focusManager = FocusManager()
    
    var body: some Scene {
#if os(macOS)
        macOSRootView
#endif
#if os(iOS)
        EmptyView()
#endif
    }
    
    private var macOSRootView: some Scene {
        MenuBarExtra {
            if focusManager.isFocusing, let currentSession = focusManager.currentSession {
                FocusSessionControlWindow(focusSession: currentSession)
                    .environmentObject(focusManager)
            } else {
                FocusSessionCreationWindow()
                    .environmentObject(focusManager)
            }
        } label: {
            HStack {
                if focusManager.isFocusing, let currentSession = focusManager.currentSession {
                    Text(currentSession.focusItem.title)
                } else {
                    Image(systemName: "hourglass")
                }
            }
        }
        .menuBarExtraStyle(.window)
    }
}
