//
//  BindableObservableDemo.swift
//  PropertyWrappersProject
//
//  Created by Alvaro Guerra Freitas on 7/3/25.
//

import SwiftUI

struct BindableObservableDemo: View {
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
        VStack(spacing: 16) {
            Text("ViewModel")
                .font(.headline)
                .foregroundColor(.secondary)

            Text("var username = \"\(viewModel.username)\"")
                .font(.caption)
                .padding(6)
                .background(tab.theme.secondaryColor.opacity(0.2))
                .cornerRadius(4)
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
                Text("Nombre observado:")
                    .font(.subheadline)
                
                Text("\(viewModel.username)")
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
    @Bindable var viewModel: ObservableViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Vista hija")
                .font(.headline)
                .foregroundColor(.secondary)
            
            Text("@Bindable var viewModel")
                .font(.caption)
                .padding(6)
                .background(tab.theme.secondaryColor.opacity(0.2))
                .cornerRadius(4)
            
            TextField("Modificar usuario", text: $viewModel.username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(tab.theme.backgroundColor)
        .cornerRadius(6)
    }
}

#Preview {
    BindableObservableDemo(tab: .bindableObservable)
}
