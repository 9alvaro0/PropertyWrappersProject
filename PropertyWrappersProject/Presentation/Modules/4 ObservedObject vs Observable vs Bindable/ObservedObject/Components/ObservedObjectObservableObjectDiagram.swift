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
        CardView(tab: tab) {
            Text("Cómo Funciona @ObservedObject")
                .font(.system(.title2, design: .rounded, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 20) {
                HStack(spacing: 0) {
                    VStack(spacing: 8) {
                        Text("Vista Padre")
                            .font(.headline)
                            .foregroundColor(.secondary)
                        
                        Text("@StateObject var")
                            .font(.system(.caption, design: .monospaced))
                            .padding(6)
                            .background(tab.theme.primaryColor.opacity(0.1))
                            .cornerRadius(4)
                        
                        Text("Crea y posee")
                            .font(.caption)
                            .foregroundColor(.secondary)
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
                        
                        Text("@ObservedObject var")
                            .font(.system(.caption, design: .monospaced))
                            .padding(6)
                            .background(tab.theme.secondaryColor.opacity(0.1))
                            .cornerRadius(4)
                        
                        Text("Observa")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.vertical)
                
                VStack(spacing: 8) {
                    Text("ViewModel")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    
                    Text("@Published var")
                        .font(.system(.caption, design: .monospaced))
                        .padding(6)
                        .background(tab.theme.primaryColor.opacity(0.5))
                        .cornerRadius(4)
                    
                    Text("Fuente de verdad")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                ProcessSection(tab: tab)
            }
        }
    }
}

#Preview {
    ObservedObjectObservableObjectDiagram(tab: .observedObjectObservableObject)
}

