//
//  BindingDiagram.swift
//  PropertyWrappersProject
//
//  Created by Alvaro Guerra Freitas on 7/3/25.
//

import SwiftUI

struct BindingDiagram: View {
    let tab: Tab
    
    var body: some View {
        CardView(tab: tab) {
            Text("Cómo Funciona @Binding")
                .font(.system(.title2, design: .rounded, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 20) {
                HStack(spacing: 0) {
                    VStack(spacing: 8) {
                        Text("Vista Padre")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(.secondary)
                        
                        Text("@State var")
                            .font(.system(.caption, design: .monospaced))
                            .padding(6)
                            .background(tab.theme.primaryColor.opacity(0.1))
                            .cornerRadius(4)
                        
                        Text("Fuente de verdad")
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .padding(.bottom, 8)
                    }
                    
                    VStack {
                        Image(systemName: "arrow.right")
                            .font(.title2)
                            .foregroundColor(tab.theme.primaryColor)
                        
                        Text("$userName")
                            .font(.caption)
                            .foregroundColor(tab.theme.primaryColor)
                        
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .foregroundColor(tab.theme.primaryColor)
                    }
                    .padding()
                    
                    VStack(spacing: 8) {
                        Text("Vista Hija")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(.secondary)
                        
                        Text("@Binding var")
                            .font(.system(.caption, design: .monospaced))
                            .padding(6)
                            .background(tab.theme.secondaryColor.opacity(0.1))
                            .cornerRadius(4)
                        
                        Text("Referencia")
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
    BindingDiagram(tab: .binding)
}
