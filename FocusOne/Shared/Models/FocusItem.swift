//
//  FocusItem.swift
//  FocusOne
//
//  Created by Roy Zhang on 2025/10/1.
//

import Foundation

/// 专注项
struct FocusItem: Identifiable {
    let id = UUID().uuidString
    let createdAt: Date = Date()
    let title: String
}
