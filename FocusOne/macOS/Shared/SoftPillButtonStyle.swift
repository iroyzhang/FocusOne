//
//  SoftPillButtonStyle.swift
//  FocusOne
//
//  Created by Roy Zhang on 2025/10/1.
//

#if os(macOS)
import SwiftUI

struct SoftPillButtonStyle: ButtonStyle {
    var fill: Color = Color.primary.opacity(0.06)
    var pressedFill: Color = Color.primary.opacity(0.12)
    var foreground: Color = .primary
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 13, weight: .semibold))
            .padding(.vertical, 8)
            .padding(.horizontal, 14)
            .background(configuration.isPressed ? pressedFill : fill)
            .foregroundColor(foreground)
            .cornerRadius(12)
    }
}
#endif
