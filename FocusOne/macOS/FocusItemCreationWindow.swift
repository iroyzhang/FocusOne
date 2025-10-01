//
//  FocusItemCreationWindow.swift
//  FocusOne
//
//  Created by Roy Zhang on 2025/10/1.
//

#if os(macOS)
import SwiftUI

struct FocusItemCreationWindow: View {
    
    @State private var inputText = ""
    @State private var showCheckInterval: Bool = false
    @State private var customCheckInterval: Int = 25
    @State private var shouldCheck = false
    
    var body: some View {
        VStack(spacing: 12) {
            // 任务创建视图
            HStack(spacing: 4) {
                TextField("", text: $inputText, prompt: Text("此刻，你最想专注的是…")
                    .foregroundColor(.secondary))
                .textFieldStyle(.plain) // 取消默认边框
                .font(.system(size: 13))
                .padding(.vertical, 6)
                .padding(.horizontal, 8)
                .background(Color.clear) // 背景透明
                
                Button(action: { withAnimation { showCheckInterval.toggle() } }) {
                    Image(systemName: "timer")
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(showCheckInterval ? .accentColor : .secondary)
                        .padding(.trailing, 4)
                }
                .buttonStyle(.plain)
                
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
            
            if showCheckInterval {
                adjustCheckIntervalView
            }
            
            focusButton
        }
        .padding(12)
        .frame(width: 360)
        .background(Color.clear)
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
            
        }) {
            Text("开始专注")
                .font(.headline)
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(SoftPillButtonStyle(fill: Color.gray.opacity(0.2)))
        .disabled(inputText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
        .opacity(inputText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? 0.4 : 1.0)
    }
}
#endif
