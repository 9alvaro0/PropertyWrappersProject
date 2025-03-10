//
//  ComparisonSection.swift
//  PropertyWrappersProject
//
//  Created by Alvaro Guerra Freitas on 7/3/25.
//

import SwiftUI

struct ComparisonSection: View {
    let tab: Tab
    let tabs: [Tab]
    let proxy: ScrollViewProxy
    @State private var showComparison = false

    var body: some View {
        // Comparison Button
        Button(action: {
            withAnimation {
                showComparison.toggle()
                if showComparison {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        withAnimation {
                            proxy.scrollTo("comparisonView", anchor: .top)
                        }
                    }
                }
            }
        }) {
            Text(showComparison ? "Ocultar Comparación" : "Mostrar Comparación")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .background(tab.theme.primaryColor)
                .cornerRadius(10)
        }
        .padding(.horizontal)
        
        if showComparison {
            comparisonView
                .id("comparisonView")
                .transition(.move(edge: .bottom).combined(with: .opacity))
                .padding(.horizontal)
        }
    }
    
    private var comparisonView: some View {
        VStack(spacing: 20) {
            Text("Comparación")
                .font(.system(.title2, design: .rounded, weight: .bold))
                .foregroundColor(tab.theme.primaryColor)
            
            HStack(alignment: .top, spacing: 20) {
                VStack(spacing: 6) {
                    Text("@StateObject")
                        .font(.headline)
                        .foregroundColor(tabs[0].theme.primaryColor)
                    Text("+")
                        .font(.headline)
                        .foregroundColor(tabs[0].theme.primaryColor)
                    Text("@ObservableObject")
                        .font(.headline)
                        .foregroundColor(tabs[0].theme.primaryColor)
                    
                    bulletPoint("Usado antes de iOS 17")
                    bulletPoint("Requiere ObservableObject")
                    bulletPoint("Usa @Published para propiedades")
                    bulletPoint("Más verboso")
                    bulletPoint("Ideal para objetos complejos")
                }
                .frame(maxWidth: .infinity)
                
                VStack(spacing: 6) {
                    Text("@State")
                        .font(.headline)
                        .foregroundColor(tabs[1].theme.primaryColor)
                    Text("+")
                        .font(.headline)
                        .foregroundColor(tabs[1].theme.primaryColor)
                    Text("@Observable")
                        .font(.headline)
                        .foregroundColor(tabs[1].theme.primaryColor)
                    
                    bulletPoint("Introducido en iOS 17")
                    bulletPoint("Usa @Observable directamente")
                    bulletPoint("No necesita @Published")
                    bulletPoint("Sintaxis más simple")
                    bulletPoint("Funciona con cualquier tipo de objeto")
                }
                .frame(maxWidth: .infinity)
            }
            .multilineTextAlignment(.center)
            .padding()
            .background(tab.theme.cardBackground)
            .cornerRadius(16)
            
            Text("Recomendación")
                .font(.headline)
                .foregroundColor(tab.theme.primaryColor)
            
            Text("Para nuevos proyectos que requieran iOS 17+, usa @State con @Observable. Para compatibilidad con versiones anteriores o proyectos existentes, mantén @StateObject.")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .padding()
                .background(tab.theme.cardBackground)
                .cornerRadius(16)
        }
        .padding()
        .background(tab.theme.cardBackground)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
    }
    
    private func bulletPoint(_ text: String) -> some View {
        HStack(alignment: .top, spacing: 8) {
            Image(systemName: "circle.fill")
                .font(.system(size: 6))
                .foregroundColor(.secondary)
                .padding(.top, 6)
            
            Text(text)
                .font(.subheadline)
        }
    }
}

#Preview {
    ScrollViewReader { proxy in
        ComparisonSection(
            tab: .stateObject([]),
            tabs: [.stateObjectObservableObject, .stateObservable],
            proxy: proxy
        )
    }
}
