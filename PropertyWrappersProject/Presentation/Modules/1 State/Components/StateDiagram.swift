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
        VStack(spacing: 16) {
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
                        
                        VStack(spacing: 8) {
                            Divider()
                                .padding(.horizontal, 16)
                            
                            Text("\(count)")
                                .font(.caption)
                                .padding(4)
                                .background(tab.theme.primaryColor.opacity(0.2))
                                .cornerRadius(4)
                            
                            Text("count")
                                .font(.caption)
                                .foregroundColor(.secondary)
                                .padding(.bottom, 8)
                        }
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
                        
                        VStack(spacing: 8) {
                            Divider()
                                .padding(.horizontal, 16)
                            
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
                        
                        Text("SwiftUI almacena el valor de @State fuera de la estructura de la vista")
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
                        
                        Text("Cuando el valor cambia, SwiftUI detecta el cambio")
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
                        
                        Text("La vista se redibuja automáticamente con el nuevo valor")
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
    StateDiagram(tab: .state, count: 0)
}
