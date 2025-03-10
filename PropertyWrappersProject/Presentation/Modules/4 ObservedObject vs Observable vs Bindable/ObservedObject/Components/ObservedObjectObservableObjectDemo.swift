//
//  ObservedObjectObservableObjectDemo.swift
//  PropertyWrappersProject
//
//  Created by Alvaro Guerra Freitas on 7/3/25.
//

import SwiftUI

struct ObservedObjectObservableObjectDemo: View {
    let tab: Tab
    
    @StateObject private var viewModel = ObservableObjectViewModel()
    @State private var isAnimating: Bool = false
    @State private var localUsername: String = ""

    var body: some View {
        VStack(spacing: 24) {
            Text("Demostración Interactiva")
                .font(.title2.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
            
            viewModelCard
            observedObjectCard
            interactionCard
        }
        .padding()
        .background(tab.theme.cardBackground)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
    }
    
    private var viewModelCard: some View {
        VStack(spacing: 16) {
            Text("ViewModel (ObservableObject)")
                .font(.headline)
                .foregroundColor(.secondary)

            Text("@Published var username = \"\(viewModel.username)\"")
                .font(.caption)
                .padding(6)
                .background(tab.theme.secondaryColor.opacity(0.2))
                .cornerRadius(4)
            
            Button("Actualizar username en ViewModel") {
                withAnimation {
                    viewModel.updateUsername()
                    isAnimating = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        isAnimating = false
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            .tint(tab.theme.primaryColor)
        }
        .padding()
        .background(tab.theme.cardBackground)
        .cornerRadius(12)
    }
    
    private var observedObjectCard: some View {
        VStack(spacing: 16) {
            Text("Vista Secundaria (@ObservedObject)")
                .font(.headline)
                .foregroundColor(.secondary)

            Text("@ObservedObject var viewModel")
                .font(.caption)
                .padding(6)
                .background(tab.theme.secondaryColor.opacity(0.2))
                .cornerRadius(4)
            
            SecondaryView(viewModel: viewModel)
        }
        .padding()
        .background(tab.theme.cardBackground)
        .cornerRadius(12)
    }
    
    private var interactionCard: some View {
        VStack(spacing: 16) {
            Text("Interacción con Binding")
                .font(.headline)
                .foregroundColor(.secondary)
            
            TextField("Modificar username", text: $localUsername)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Button("Aplicar cambio") {
                withAnimation {
                    viewModel.username = localUsername
                    isAnimating = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        isAnimating = false
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            .tint(tab.theme.primaryColor)
            .disabled(localUsername.isEmpty)
        }
        .padding()
        .background(tab.theme.cardBackground)
        .cornerRadius(12)
    }
}

private struct SecondaryView: View {
    @ObservedObject var viewModel: ObservableObjectViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Username observado:")
                .font(.subheadline)
            
            Text(viewModel.username)
                .font(.title3.bold())
                .foregroundColor(.primary)
                .padding()
                .background(Color.secondary.opacity(0.1))
                .cornerRadius(8)
        }
    }
}

#Preview {
    ObservedObjectObservableObjectDemo(tab: .observedObjectObservableObject)
}

