//
//  ObservableObjectDemo.swift
//  PropertyWrappersProject
//
//  Created by Alvaro Guerra Freitas on 7/3/25.
//

import SwiftUI

struct ObservableObjectDemo: View {
    let tab: Tab
    @ObservedObject var viewModel: ObservableObjectViewModel
    
    @State private var isAnimating: Bool = false
    
    var body: some View {
        CardView(tab: tab) {
            Text("Demostración Interactiva")
                .font(.title2.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 20) {
                Text("ViewModel")
                    .font(.headline)
                    .foregroundColor(.secondary)
                
                Text("@Published var count = \(viewModel.count)")
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
            .cornerRadius(6)
            
            VStack(spacing: 20) {
                Text("Vista")
                    .font(.headline)
                    .foregroundColor(.secondary)
                
                Text("@StateObject var viewModel = ViewModel()")
                    .font(.caption)
                    .padding(6)
                    .background(tab.theme.secondaryColor.opacity(0.2))
                    .cornerRadius(4)
                
                ZStack {
                    Circle()
                        .stroke(tab.theme.primaryColor.opacity(0.3), lineWidth: 12)
                        .frame(width: 120, height: 120)
                    
                    Text("\(viewModel.count)")
                        .font(.system(size: 48, weight: .bold, design: .rounded))
                        .foregroundColor(tab.theme.primaryColor)
                        .scaleEffect(isAnimating ? 1.15 : 1.0)
                        .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isAnimating)
                }
                
                Text("viewModel.count")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding(4)
                
                Button {
                    withAnimation {
                        viewModel.increment()
                        isAnimating = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            isAnimating = false
                        }
                    }
                } label: {
                    Label("Incrementar", systemImage: "plus.circle.fill")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(tab.theme.primaryColor)
                        .cornerRadius(10)
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(tab.theme.backgroundColor)
            .cornerRadius(16)
        }
    }
}

#Preview {
    ObservableObjectDemo(
        tab: .stateObjectObservableObject,
        viewModel: .init()
    )
}
