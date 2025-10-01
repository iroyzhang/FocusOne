//
//  FocusSessionControlWindow.swift
//  FocusOne
//
//  Created by Roy Zhang on 2025/10/1.
//

#if os(macOS)
import SwiftUI

struct FocusSessionControlWindow: View {
    @State var focusSession: FocusSession
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(focusSession.focusItem.title)
            
            Button {
                
            } label: {
                Text("完成")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(SoftPillButtonStyle(fill: Color.gray.opacity(0.2)))
            
            Button {
                
            } label: {
                Text("放弃")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(SoftPillButtonStyle(fill: Color.gray.opacity(0.2)))
        }
        .padding(12)
        .background(Color.clear)
    }
}
#endif
