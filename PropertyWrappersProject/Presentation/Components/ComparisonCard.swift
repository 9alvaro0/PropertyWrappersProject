//
//  ComparisonCard.swift
//  PropertyWrappersProject
//
//  Created by Alvaro Guerra Freitas on 10/3/25.
//

import SwiftUI

struct ComparisonCard: View {
    let title: String
    let points: [String]
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .foregroundColor(color)
            
            ForEach(points, id: \.self) { point in
                bulletPoint(point)
            }
        }
        .containerRelativeFrame(.horizontal, count: 1, span: 1, spacing: 0, alignment: .center)
    }
    
    private func bulletPoint(_ text: String) -> some View {
        HStack(alignment: .top, spacing: 4) {
            Text("•")
                .foregroundColor(.secondary)
            Text(text)
                .font(.subheadline)
        }
    }
}

#Preview {
    ComparisonCard(
        title: "Comparación",
        points: [
            "Los tres wrappers son propiedades que se actualizan y reflejan cambios en la vista.",
            "Cada uno tiene un propósito y alcance diferente.",
            "Los tres son propiedades que se actualizan y reflejan cambios en la vista.",
            "Cada uno tiene un propósito y alcance diferente."
        ],
        color: .blue
    )
}
