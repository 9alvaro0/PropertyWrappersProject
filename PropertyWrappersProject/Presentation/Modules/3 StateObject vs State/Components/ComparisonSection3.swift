//
//  ComparisonSection.swift
//  PropertyWrappersProject
//
//  Created by Alvaro Guerra Freitas on 7/3/25.
//

import SwiftUI

struct ComparisonSection3: View {
    let tab: Tab
    let tabs: [Tab]
    let proxy: ScrollViewProxy
    @State private var showComparison = false
    
    var body: some View {
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
        CardView(tab: tab) {
            Text("Comparación")
                .font(.system(.title2, design: .rounded, weight: .bold))
                .foregroundColor(tab.theme.primaryColor)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 16) {
                    ComparisonCard(
                        title: "@StateObject + ObservableObject",
                        points: [
                            "Usado antes de iOS 17",
                            "Requiere ObservableObject",
                            "Usa @Published para propiedades",
                            "Más verboso",
                            "Ideal para objetos complejos"
                        ],
                        color: tabs[0].theme.primaryColor
                    )
                    
                    ComparisonCard(
                        title: "@State + @Observable",
                        points: [
                            "Introducido en iOS 17",
                            "Usa @Observable directamente",
                            "No necesita @Published",
                            "Sintaxis más simple",
                            "Funciona con cualquier tipo de objeto"
                        ],
                        color: tabs[0].theme.primaryColor
                    )
                }
                .scrollTargetLayout()
                .padding(.horizontal)
            }
            .scrollTargetBehavior(.viewAligned(limitBehavior: .alwaysByOne))
            
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
    }
}

#Preview {
    ScrollViewReader { proxy in
        ComparisonSection3(
            tab: .stateObject([]),
            tabs: [.stateObjectObservableObject, .stateObservable],
            proxy: proxy
        )
    }
}
