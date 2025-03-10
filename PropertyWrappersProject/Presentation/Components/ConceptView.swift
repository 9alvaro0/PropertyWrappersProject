//
//  ConceptView.swift
//  PropertyWrappersProject
//
//  Created by Alvaro Guerra Freitas on 6/3/25.
//

import SwiftUI

struct ConceptView: View {
    let tab: Tab
    
    @State private var showExplanation: Bool = false
    
    var body: some View {
        VStack(spacing: 16) {
            Text(tab.concept.title)
                .font(.system(.title2, design: .rounded, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(tab.concept.description)
            .multilineTextAlignment(.leading)
            .lineSpacing(4)
            
            if showExplanation {
                Text(tab.concept.explanation)
                    .multilineTextAlignment(.leading)
                    .lineSpacing(4)
                    .animation(.spring(), value: showExplanation)
            }
            
            if !tab.concept.explanation.isEmpty {
                Button(action: {
                    withAnimation(.spring()) {
                        showExplanation.toggle()
                    }
                }) {
                    Text(showExplanation ? "Mostrar menos" : "Leer más")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(tab.theme.primaryColor)
                        .cornerRadius(8)
                }
            }
        }
        .padding()
        .background(tab.theme.cardBackground)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    ConceptView(tab: .binding)
}
