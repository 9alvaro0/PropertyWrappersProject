//
//  ProcessSection.swift
//  PropertyWrappersProject
//
//  Created by Alvaro Guerra Freitas on 10/3/25.
//

import SwiftUI

struct ProcessSection: View {
    let tab: Tab
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Proceso:")
                .font(.headline)
            
            ForEach(Array(tab.process.steps.enumerated()), id: \.element) { index, step in
                HStack(alignment: .top, spacing: 12) {
                    Text("\(index + 1)")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 24, height: 24)
                        .background(tab.theme.primaryColor)
                        .cornerRadius(12)
                    
                    Text(step)
                        .font(.subheadline)
                }
            }
        }
        .padding()
        .background(tab.theme.backgroundColor)
        .cornerRadius(12)
    }
}

#Preview {
    ProcessSection(tab: .binding)
}
