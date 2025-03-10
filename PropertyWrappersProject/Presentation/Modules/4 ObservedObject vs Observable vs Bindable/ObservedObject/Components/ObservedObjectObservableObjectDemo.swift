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
    
    var body: some View {
        CardView(tab: tab) {
            Text("Demostración Interactiva")
                .font(.title2.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
            
            viewModelCard
            parentView
            ChildView(
                tab: tab,
                viewModel: viewModel
            )
            .onChange(of: viewModel.username) {
                withAnimation {
                    isAnimating = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        isAnimating = false
                    }
                }
            }
        }
    }
    
    private var viewModelCard: some View {
        VStack(spacing: 16) {
            Text("ViewModel")
                .font(.headline)
                .foregroundColor(.secondary)
            
            Text("@Published var username = \"\(viewModel.username)\"")
                .font(.caption)
                .padding(6)
                .background(tab.theme.secondaryColor.opacity(0.2))
                .cornerRadius(4)
                .scaleEffect(isAnimating ? 1.05 : 1.0)
                .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isAnimating)
            
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
        .frame(maxWidth: .infinity)
        .padding()
        .background(tab.theme.backgroundColor)
        .cornerRadius(6)
    }
    
    private var parentView: some View {
        VStack(spacing: 16) {
            Text("Vista Padre")
                .font(.headline)
                .foregroundColor(.secondary)
            
            Text("@StateObject var viewModel = ViewModel()")
                .font(.caption)
                .padding(6)
                .background(tab.theme.secondaryColor.opacity(0.2))
                .cornerRadius(4)
            
            VStack(spacing: 16) {
                Text("Username observado:")
                    .font(.subheadline)
                
                Text(viewModel.username)
                    .font(.system(size: 48, weight: .bold, design: .rounded))
                    .foregroundColor(tab.theme.primaryColor)
                    .scaleEffect(isAnimating ? 1.05 : 1.0)
                    .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isAnimating)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(tab.theme.backgroundColor)
        .cornerRadius(6)
    }
}

private struct ChildView: View {
    let tab: Tab
    @ObservedObject var viewModel: ObservableObjectViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Vista hija")
                .font(.headline)
                .foregroundColor(.secondary)
            
            Text("@ObservedObject var viewModel")
                .font(.caption)
                .padding(6)
                .background(tab.theme.secondaryColor.opacity(0.2))
                .cornerRadius(4)
            
            TextField("Modificar username", text: $viewModel.username)
                .font(.title2.bold())
                .padding()
                .background(tab.theme.secondaryColor.opacity(0.1))
                .cornerRadius(8)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(tab.theme.backgroundColor)
        .cornerRadius(6)
    }
}

#Preview {
    ObservedObjectObservableObjectDemo(tab: .observedObjectObservableObject)
}

