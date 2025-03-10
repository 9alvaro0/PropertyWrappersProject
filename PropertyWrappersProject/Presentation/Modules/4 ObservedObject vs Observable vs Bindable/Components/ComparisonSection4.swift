//
//  ComparisonSection4.swift
//  PropertyWrappersProject
//
//  Created by Alvaro Guerra Freitas on 10/3/25.
//

import SwiftUI

// Sección comparativa optimizada y adaptada para mejor visualización:

struct ComparisonSection4: View {
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
                        title: "@ObservedObject",
                        points: [
                            "Usado antes de iOS 17",
                            "Requiere ObservableObject",
                            "Utiliza propiedades @Published",
                            "No gestiona el ciclo de vida",
                            "Más verboso y menos eficiente"
                        ],
                        color: tabs[0].theme.primaryColor
                    )
                    
                    ComparisonCard(
                        title: "var + @Observable",
                        points: [
                            "Introducido en iOS 17",
                            "Simplifica la reactividad",
                            "No necesita @Published",
                            "Solo lectura desde la vista",
                            "Optimiza rendimiento"
                        ],
                        color: tabs[1].theme.primaryColor
                    )
                    
                    ComparisonCard(
                        title: "@Bindable + @Observable",
                        points: [
                            "Introducido en iOS 17",
                            "Comunicación bidireccional directa",
                            "Ideal para formularios e inputs",
                            "No requiere Binding explícito",
                            "Rápido y eficiente"
                        ],
                        color: tabs[2].theme.primaryColor
                    )
                }
                .scrollTargetLayout()
                .padding(.horizontal)
            }
            .scrollTargetBehavior(.viewAligned(limitBehavior: .alwaysByOne))

            Text("Recomendación")
                .font(.headline)
                .foregroundColor(tab.theme.primaryColor)
            
            Text("Utiliza `@ObservedObject` para compatibilidad, `var + @Observable` para vistas de solo lectura y `@Bindable` para formularios interactivos.")
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
        ComparisonSection4(
            tab: .observedObject([]),
            tabs: [
                .observedObjectObservableObject,
                .varObservable,
                .bindableObservable
            ],
            proxy: proxy
        )
    }
}
