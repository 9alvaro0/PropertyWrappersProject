//
//  VarObservableDiagram.swift
//  PropertyWrappersProject
//
//  Created by Alvaro Guerra Freitas on 7/3/25.
//


import SwiftUI

struct VarObservableDiagram: View {
    let tab: Tab

    var body: some View {
        VStack(spacing: 16) {
            Text("Cómo Funciona `var` con `@Observable`")
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
                            
                            Text("@State var")
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
                            
                            Text("var viewModel")
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
                        
                        Text("var")
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
                    Text("📖 Proceso:")
                        .font(.headline)

                    numberedStep("1️⃣", "La vista recibe el `ViewModel` como `var`, lo que significa que solo puede leer sus valores.")
                    numberedStep("2️⃣", "`@Observable` permite que SwiftUI rastree cambios, pero la vista **no puede modificar el objeto**.")
                    numberedStep("3️⃣", "Ideal para vistas que solo muestran datos sin modificarlos.")
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

    private func numberedStep(_ number: String, _ text: String) -> some View {
        HStack(alignment: .top, spacing: 12) {
            Text(number)
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: 24, height: 24)
                .background(tab.theme.primaryColor)
                .cornerRadius(12)

            Text(text)
                .font(.subheadline)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}

#Preview {
    VarObservableDiagram(tab: .varObservable)
}
