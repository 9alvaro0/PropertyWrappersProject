//
//  BindingDemo.swift
//  PropertyWrappersProject
//
//  Created by Alvaro Guerra Freitas on 7/3/25.
//

import SwiftUI

struct BindingDemo: View {
    let tab: Tab
    
    @State private var userName: String = "Alvaro"
    @State private var isAnimating: Bool = false
    
    var body: some View {
        CardView(tab: tab) {
            Text("Demostración Interactiva")
                .font(.title2.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 20) {
                Text("Vista Padre")
                    .font(.headline)
                    .foregroundColor(.secondary)
                
                Text("@State var userName = ''\(userName)''")
                    .font(.caption)
                    .padding(6)
                    .background(tab.theme.secondaryColor.opacity(0.2))
                    .cornerRadius(4)
                    .scaleEffect(isAnimating ? 1.05 : 1.0)
                    .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isAnimating)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(tab.theme.backgroundColor)
            .cornerRadius(16)
            
            ChildView(tab: tab, name: $userName)
                .onChange(of: userName) {
                    withAnimation {
                        isAnimating = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            isAnimating = false
                        }
                    }
                }
        }
    }
}

private struct ChildView: View {
    let tab: Tab
    @Binding var name: String
    
    var body: some View {
        VStack(spacing: 8) {
            Text("Vista Hija")
                .font(.headline)
                .foregroundColor(.secondary)
            
            TextField("Ingresa tu nombre", text: $name)
                .font(.title2.bold())
                .padding()
                .background(tab.theme.secondaryColor.opacity(0.1))
                .cornerRadius(8)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(tab.theme.backgroundColor)
        .cornerRadius(16)
    }
}

#Preview {
    BindingDemo(tab: .binding)
}
