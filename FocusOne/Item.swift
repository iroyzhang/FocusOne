//
//  Item.swift
//  FocusOne
//
//  Created by Roy Zhang on 2025/10/1.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
