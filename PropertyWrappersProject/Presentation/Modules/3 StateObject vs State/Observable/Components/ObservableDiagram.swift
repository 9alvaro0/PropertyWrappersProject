//
//  ObservableDiagram.swift
//  PropertyWrappersProject
//
//  Created by Alvaro Guerra Freitas on 7/3/25.
//

import SwiftUI

struct ObservableDiagram: View {
    let tab: Tab
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Cómo Funciona @State con @Observable")
                .font(.system(.title2, design: .rounded, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 20) {
                // Diagram
                HStack(spacing: 20) {
                    // View
                    VStack(spacing: 8) {
                        Text("Vista")
                            .font(.headline)
                            .foregroundColor(.secondary)
                        
                        VStack(spacing: 12) {
                            Divider()
                                .padding(.horizontal, 16)
                            
                            Text("@State var viewModel")
                                .font(.caption)
                                .padding(4)
                                .background(tab.theme.primaryColor.opacity(0.2))
                                .cornerRadius(4)
                            
                            Text("Instancia")
                                .font(.caption)
                                .foregroundColor(.secondary)
                                .padding(.bottom, 8)
                        }
                    }
                    
                    VStack {
                        Image(systemName: "arrow.right")
                            .font(.title2)
                            .foregroundColor(tab.theme.primaryColor)
                        Text("$count")
                            .font(.caption)
                            .foregroundColor(tab.theme.primaryColor)
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .foregroundColor(tab.theme.primaryColor)
                    }
                    .padding()
                    
                    VStack(spacing: 8) {
                        Text("ViewModel")
                            .font(.headline)
                            .foregroundColor(.secondary)
                        
                        VStack(spacing: 8) {
                            Divider()
                                .padding(.horizontal, 16)
                            
                            Text("var")
                                .font(.caption)
                                .padding(4)
                                .background(tab.theme.secondaryColor.opacity(0.2))
                                .cornerRadius(4)
                            
                            Text("Fuente de verdad")
                                .font(.caption)
                                .foregroundColor(.secondary)
                                .padding(.bottom, 8)
                        }
                    }
                }
                
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
                        
                        Text("La vista crea el ViewModel con @State")
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
                        
                        Text("@Observable permite a SwiftUI rastrear cambios automáticamente")
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
                        
                        Text("Cualquier cambio en el ViewModel actualiza la UI")
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
    ObservableDiagram(tab: .stateObservable)
}
