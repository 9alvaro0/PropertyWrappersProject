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
        VStack(spacing: 16) {
            Text("Cómo Funciona @Binding")
                .font(.system(.title2, design: .rounded, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 20) {
                // Diagram
                HStack(spacing: 0) {
                    // Parent View
                    VStack(spacing: 8) {
                        Text("Vista Padre")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(.secondary)
                        
                        VStack(spacing: 12) {
                            Divider()
                                .padding(.horizontal, 16)
                            
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
                        .background(Color(.systemGray5))
                        .cornerRadius(12)
                    }
                    
                    VStack {
                        Image(systemName: "arrow.right")
                            .font(.title2)
                            .foregroundColor(tab.theme.primaryColor)
                        Text("$playerName")
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
                        
                        VStack(spacing: 12) {
                            Divider()
                                .padding(.horizontal, 16)
                            
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
                        .background(Color(.systemGray5))
                        .cornerRadius(12)
                    }
                }
                .padding(.vertical)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Proceso:")
                        .font(.headline)
                    
                    HStack(alignment: .top, spacing: 12) {
                        Text("1")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 24, height: 24)
                            .background(tab.theme.primaryColor)
                            .cornerRadius(12)
                        
                        Text("La vista padre pasa el estado con $ (ej: $playerName)")
                            .font(.subheadline)
                    }
                    
                    HStack(alignment: .top, spacing: 12) {
                        Text("2")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 24, height: 24)
                            .background(tab.theme.primaryColor)
                            .cornerRadius(12)
                        
                        Text("La vista hija recibe una referencia al estado (@Binding)")
                            .font(.subheadline)
                    }
                    
                    HStack(alignment: .top, spacing: 12) {
                        Text("3")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 24, height: 24)
                            .background(tab.theme.primaryColor)
                            .cornerRadius(12)
                        
                        Text("Los cambios en la vista hija actualizan el estado en la vista padre")
                            .font(.subheadline)
                    }
                }
                .padding()
                .background(Color(.systemGray5))
                .cornerRadius(12)
            }
        }
        .padding()
        .background(tab.theme.cardBackground)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    BindingDiagram(tab: .binding)
}
