//
//  KeyPoints.swift
//  PropertyWrappersProject
//
//  Created by Alvaro Guerra Freitas on 7/3/25.
//

import SwiftUI

struct KeyPoints: View {
    let tab: Tab
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Puntos Clave")
                .font(.system(.title2, design: .rounded, weight: .bold))
            
            VStack(alignment: .leading, spacing: 12) {
                ForEach(Array(tab.keyPoints.enumerated()), id: \.offset) { index, keyPoint in
                    KeyPoint(tab: tab, number: "\(index + 1)️⃣", text: keyPoint)
                }
            }
        }
        .padding()
        .background(tab.theme.cardBackground)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
    }
}

struct KeyPoint: View {
    let tab: Tab
    let number: String
    let text: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Text(number)
                .font(.headline)
                .foregroundColor(tab.theme.primaryColor)
            
            Text(text)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}

#Preview {
    KeyPoint(
        tab: .binding,
        number: "1️⃣",
        text: "`@State` se usa para datos simples y locales de una vista."
    )
}
