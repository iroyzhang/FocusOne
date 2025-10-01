//
//  FocusSession.swift
//  FocusOne
//
//  Created by Roy Zhang on 2025/10/1.
//

import Foundation

struct FocusSession {
    let focusItem: FocusItem
    var startDate: Date?
    var endDate: Date?
    /// 提醒间隔（分钟）
    let checkInterval: Int
    /// 状态
    var status: FocusStatus = .pending
    
    init(focusItem: FocusItem, checkInterval: Int) {
        self.focusItem = focusItem
        self.checkInterval = checkInterval
    }
    
    mutating
    func start() {
        self.startDate = Date()
        self.status = .inProgress
    }
    
    mutating
    func complete() {
        self.endDate = Date()
        self.status = .completed
    }
    
    mutating
    func abandon() {
        self.endDate = Date()
        self.status = .abandoned
    }
}

/// 专注状态
enum FocusStatus: String {
    case pending
    case inProgress
    case completed
    case abandoned
}
