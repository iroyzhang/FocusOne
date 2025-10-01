//
//  FocusManager.swift
//  FocusOne
//
//  Created by Roy Zhang on 2025/10/1.
//

import Foundation

final class FocusManager: ObservableObject {
    @Published var currentSession: FocusSession?
    
    var isFocusing: Bool {
        return currentSession != nil
    }
    
    func focus(_ session: FocusSession) {
        self.currentSession = session
    }
}
