//
//  FocusSessionCreationWindow.swift
//  FocusOne
//
//  Created by Roy Zhang on 2025/10/1.
//

#if os(macOS)
import SwiftUI

struct FocusSessionCreationWindow: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var focusManager: FocusManager
    
    @State private var inputText = ""
    @State private var showCheckInterval: Bool = false
    @State private var customCheckInterval: Int = 20
    @State private var shouldCheck = false
    
    var body: some View {
        VStack(spacing: 12) {
            HStack(spacing: 4) {
                inputTextView
                showCheckIntervalButton
                SettingsMenu()
            }
            
            if showCheckInterval {
                adjustCheckIntervalView
            }
            
            focusButton
        }
        .padding(12)
        .frame(width: 360)
        .background(Color.clear)
    }
    
    private var inputTextView: some View {
        TextField("", text: $inputText, prompt: Text("此刻，你最想专注的是…")
            .foregroundColor(.secondary))
            .textFieldStyle(.plain)
            .font(.system(size: 14))
            .padding(.vertical, 6)
            .padding(.horizontal, 8)
            .background(Color.clear)
    }
    
    private var showCheckIntervalButton: some View {
        Button(action: { withAnimation { showCheckInterval.toggle() } }) {
            Image(systemName: "timer")
                .font(.system(size: 13, weight: .medium))
                .foregroundColor(showCheckInterval ? .accentColor : .secondary)
                .padding(.trailing, 4)
        }
        .buttonStyle(.plain)
    }
    
    private var adjustCheckIntervalView: some View {
        HStack(spacing: 12) {
            Stepper(value: $customCheckInterval, in: 5...120, step: 5) {
                Text("\(customCheckInterval) 分钟")
                    .font(.system(size: 13))
            }
            .background(Color.clear)
            .transition(.opacity.combined(with: .move(edge: .top)))
            
            Toggle(isOn: $shouldCheck) {
                Text("不提醒")
                    .font(.system(size: 13))
            }
            .toggleStyle(.checkbox)
            .foregroundColor(.secondary)
        }
    }
    
    private var focusButton: some View {
        Button(action: {
            focus()
        }) {
            Text("开始专注")
                .font(.headline)
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(SoftPillButtonStyle(fill: Color.gray.opacity(0.2)))
        .disabled(inputText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
        .opacity(inputText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? 0.4 : 1.0)
    }
    
    private func focus() {
        guard !inputText.isEmpty else { return }
        let focusItem = FocusItem(title: inputText)
        let focusSession = FocusSession(focusItem: focusItem, checkInterval: customCheckInterval)
        focusManager.focus(focusSession)
        dismiss()
    }
    
}
#endif
