//
//  ObservableView.swift
//  PropertyWrappersProject
//
//  Created by Alvaro Guerra Freitas on 6/3/25.
//

import SwiftUI

struct ObservableView: View {
    let tab: Tab
    
    @State private var viewModel = ObservableViewModel()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 24) {
                TabHeader(tab: tab)
                ConceptView(tab: tab)
                ObservableDemo(
                    tab: tab,
                    viewModel: viewModel
                )
                ObservableDiagram(tab: tab)
                KeyPoints(tab: tab)
            }
        }
        .contentMargins(.horizontal, 16)
        .background(tab.theme.backgroundColor)
    }
}



#Preview {
    ObservableView(tab: .stateObservable)
}

