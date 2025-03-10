//
//  ObservableObjectView.swift
//  PropertyWrappersProject
//
//  Created by Alvaro Guerra Freitas on 6/3/25.
//

import SwiftUI

struct ObservableObjectView: View {
    let tab: Tab
    
    @StateObject private var viewModel = ObservableObjectViewModel()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 24) {
                TabHeader(tab: tab)
                ConceptView(tab: tab)
                ObservableObjectDemo(
                    tab: tab,
                    viewModel: viewModel
                )
                ObservableObjectDiagram(tab: tab)
                KeyPoints(tab: tab)
            }
        }
        .contentMargins(.horizontal, 16)
        .background(tab.theme.backgroundColor)
    }
}

#Preview {
    ObservableObjectView(tab: .stateObjectObservableObject)
}

