//
//  StateDiagram.swift
//  PropertyWrappersProject
//
//  Created by Alvaro Guerra Freitas on 7/3/25.
//

import SwiftUI

struct StateDiagram: View {
    let tab: Tab
    let count: Int
    
    var body: some View {
        CardView(tab: tab) {
            Text("Cómo Funciona @State")
                .font(.system(.title2, design: .rounded, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 20) {
                HStack(spacing: 20) {
                    VStack(spacing: 8) {
                        Text("Memoria")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(.secondary)
                        
                        Text("\(count)")
                            .font(.system(.caption, design: .monospaced))
                            .padding(6)
                            .background(tab.theme.primaryColor.opacity(0.1))
                            .cornerRadius(4)
                        
                        Text("count")
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .padding(.bottom, 8)
                    }
                    
                    VStack {
                        Image(systemName: "arrow.right")
                            .font(.title2)
                            .foregroundColor(tab.theme.primaryColor)
                            .padding()
                        
                        Text("Actualiza")
                            .font(.caption)
                            .foregroundColor(tab.theme.primaryColor)
                    }
                    .padding()
                    
                    VStack(spacing: 8) {
                        Text("Vista")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(.secondary)
                        
                        Text("@State var")
                            .font(.system(.caption, design: .monospaced))
                            .padding(6)
                            .background(tab.theme.primaryColor.opacity(0.1))
                            .cornerRadius(4)
                        
                        Text("Instancia")
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .padding(.bottom, 8)
                    }
                }
                .padding(.vertical)
                
                ProcessSection(tab: tab)
            }
        }
    }
}

#Preview {
    StateDiagram(tab: .state, count: 0)
}
