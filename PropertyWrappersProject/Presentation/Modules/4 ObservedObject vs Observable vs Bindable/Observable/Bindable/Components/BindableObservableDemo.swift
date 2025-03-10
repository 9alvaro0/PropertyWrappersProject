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
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Demostración Interactiva")
                .font(.title2.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
            
            viewModelCard
            observableCard
        }
        .padding()
        .background(tab.theme.cardBackground)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
    }
    
    private var viewModelCard: some View {
        VStack(spacing: 16) {
            Text("ViewModel (Observable)")
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
        .background(tab.theme.cardBackground)
        .cornerRadius(12)
    }
    
    private var observableCard: some View {
        VStack(spacing: 16) {
            Text("Vista Secundaria (@Binding)")
                .font(.headline)
                .foregroundColor(.secondary)

            Text("@Binding var viewModel")
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
}

private struct SecondaryView: View {
    @Bindable var viewModel: ObservableViewModel
    
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
            
            TextField("Modificar usuario", text: $viewModel.username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 2)
    }
}

#Preview {
    BindableObservableDemo(tab: .bindableObservable)
}
