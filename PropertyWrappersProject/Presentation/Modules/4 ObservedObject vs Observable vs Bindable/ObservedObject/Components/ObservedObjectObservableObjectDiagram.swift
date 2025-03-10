//
//  ObservedObjectObservableObjectDiagram.swift
//  PropertyWrappersProject
//
//  Created by Alvaro Guerra Freitas on 7/3/25.
//


import SwiftUI

struct ObservedObjectObservableObjectDiagram: View {
    let tab: Tab
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Cómo Funciona @ObservedObject")
                .font(.system(.title2, design: .rounded, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 20) {
                HStack(spacing: 0) {
                    VStack(spacing: 8) {
                        Text("Vista Padre")
                            .font(.headline)
                            .foregroundColor(.secondary)
                        
                        VStack(spacing: 12) {
                            Divider()
                                .padding(.horizontal, 16)
                            
                            Text("@StateObject var")
                                .font(.caption)
                                .padding(4)
                                .background(tab.theme.primaryColor.opacity(0.2))
                                .cornerRadius(4)
                            
                            Text("Crea y posee")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                    
                    VStack {
                        Image(systemName: "arrow.right")
                            .font(.title2)
                            .foregroundColor(tab.theme.primaryColor)
                        Text("Pasa referencia")
                            .font(.caption)
                            .foregroundColor(tab.theme.primaryColor)
                    }
                    .padding()

                    VStack(spacing: 8) {
                        Text("Vista Hija")
                            .font(.headline)
                            .foregroundColor(.secondary)
                        
                        VStack(spacing: 12) {
                            Divider()
                                .padding(.horizontal, 16)
                            
                            Text("@ObservedObject var")
                                .font(.caption)
                                .padding(4)
                                .background(tab.theme.secondaryColor.opacity(0.2))
                                .cornerRadius(4)
                            
                            Text("Observa")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .padding(.vertical)
                
                VStack(spacing: 8) {
                    Text("ViewModel")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    
                    VStack(spacing: 12) {
                        Divider()
                            .padding(.horizontal, 16)
                        
                        Text("@Published var")
                            .font(.caption)
                            .padding(4)
                            .background(tab.theme.primaryColor.opacity(0.2))
                            .cornerRadius(4)
                        
                        Text("Fuente de verdad")
                            .font(.caption)
                            .foregroundColor(.secondary)
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
                        
                        Text("La vista padre crea y posee el ViewModel con @StateObject")
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
                        
                        Text("La vista hija recibe y observa el ViewModel con @ObservedObject")
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
                        
                        Text("Cambios en @Published notifican a todas las vistas que observan")
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
    ObservedObjectObservableObjectDiagram(tab: .observedObjectObservableObject)
}

