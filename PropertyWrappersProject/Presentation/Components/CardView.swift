//
//  CardView.swift
//  PropertyWrappersProject
//
//  Created by Alvaro Guerra Freitas on 10/3/25.
//

import SwiftUI

struct CardView<Content: View>: View {
    let tab: Tab
    @ViewBuilder let content: Content
    
    var body: some View {
        VStack(spacing: 16) {
            content
        }
        .padding()
        .background(tab.theme.cardBackground)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    CardView(tab: .binding) {
        Text("Ejemplo de CardView")
            .font(.headline)
    }
}
