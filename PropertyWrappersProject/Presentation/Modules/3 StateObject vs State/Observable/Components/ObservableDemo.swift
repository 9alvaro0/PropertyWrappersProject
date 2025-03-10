//
//  ObservableDemo.swift
//  PropertyWrappersProject
//
//  Created by Alvaro Guerra Freitas on 7/3/25.
//

import SwiftUI

struct ObservableDemo: View {
    let tab: Tab
    @Bindable var viewModel: ObservableViewModel
    
    @State private var isAnimating: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            Text("💡 Demostración Interactiva")
                .font(.title2.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 20) {
                Text("ViewModel")
                    .font(.headline)
                    .foregroundColor(.secondary)

                Text("var count = \(viewModel.count)")
                    .font(.caption)
                    .padding(6)
                    .background(tab.theme.secondaryColor.opacity(0.2))
                    .cornerRadius(4)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(tab.theme.cardBackground)
            .cornerRadius(12)
            
            VStack(spacing: 20) {
                Text("Vista")
                    .font(.headline)
                    .foregroundColor(.secondary)

                Text("@State var viewModel = ViewModel()")
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
                
                Text("$viewModel.count")
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
            .background(tab.theme.cardBackground)
            .cornerRadius(12)
        }
        .padding()
        .background(tab.theme.cardBackground)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    ObservableDemo(
        tab: .stateObservable,
        viewModel: .init()
    )
}
