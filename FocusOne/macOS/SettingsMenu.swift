//
//  SettingsMenu.swift
//  FocusOne
//
//  Created by Roy Zhang on 2025/10/1.
//

#if os(macOS)
import SwiftUI

struct SettingsMenu: View {
    var body: some View {
        Menu {
            Button("设置") {
                
            }
            Button("评分") {
                if let url = URL(string: "macappstore://apps.apple.com/app/id你的AppID") {
                    NSWorkspace.shared.open(url)
                }
            }
            Divider()
            Button("退出应用") {
                NSApplication.shared.terminate(nil)
            }
        } label: {
            Image(systemName: "gearshape")
                .font(.system(size: 13, weight: .regular))
                .foregroundColor(.secondary)
                .padding(.horizontal, 6)
        }
        .menuStyle(.borderlessButton)
        .fixedSize()
    }
}
#endif
