//
//  VarObservableDemo.swift
//  PropertyWrappersProject
//
//  Created by Alvaro Guerra Freitas on 7/3/25.
//

import SwiftUI

struct VarObservableDemo: View {
    let tab: Tab
    
    @State private var viewModel = ObservableViewModel()
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
        }
    }
    
    private var viewModelCard: some View {
        VStack(spacing: 20) {
            Text("ViewModel")
                .font(.headline)
                .foregroundColor(.secondary)

            Text("var count = \(viewModel.count)")
                .font(.caption)
                .padding(6)
                .background(tab.theme.secondaryColor.opacity(0.2))
                .cornerRadius(4)
            
            Button("Incrementar count en ViewModel") {
                withAnimation {
                    viewModel.increment()
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
            
            Text("@State var viewModel = ViewModel()")
                .font(.caption)
                .padding(6)
                .background(tab.theme.secondaryColor.opacity(0.2))
                .cornerRadius(4)
            
            VStack(spacing: 16) {
                Text("Contador observado:")
                    .font(.subheadline)
                
                Text("\(viewModel.count)")
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
    var viewModel: ObservableViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Vista hija")
                .font(.headline)
                .foregroundColor(.secondary)
            
            Text("var viewModel")
                .font(.caption)
                .padding(6)
                .background(tab.theme.secondaryColor.opacity(0.2))
                .cornerRadius(4)
            
            Text("\(viewModel.count)")
                .font(.system(size: 48, weight: .bold, design: .rounded))
                .foregroundColor(tab.theme.primaryColor)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(tab.theme.backgroundColor)
        .cornerRadius(6)
    }
}

#Preview {
    VarObservableDemo(tab: .varObservable)
}
