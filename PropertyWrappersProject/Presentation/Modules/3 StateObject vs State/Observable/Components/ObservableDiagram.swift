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
        CardView(tab: tab) {
            Text("Cómo Funciona @State con @Observable")
                .font(.system(.title2, design: .rounded, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 20) {
                HStack(spacing: 20) {
                    VStack(spacing: 8) {
                        Text("Vista")
                            .font(.headline)
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
                        
                        Text("var")
                            .font(.system(.caption, design: .monospaced))
                            .padding(6)
                            .background(tab.theme.secondaryColor.opacity(0.1))
                            .cornerRadius(4)
                        
                        Text("Fuente de verdad")
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .padding(.bottom, 8)
                    }
                }
                
                ProcessSection(tab: tab)
            }
        }
    }
}

#Preview {
    ObservableDiagram(tab: .stateObservable)
}
