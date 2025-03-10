//
//  VarObservableView.swift
//  PropertyWrappersProject
//
//  Created by Alvaro Guerra Freitas on 6/3/25.
//

import SwiftUI

struct VarObservableView: View {
    let tab: Tab
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 24) {
                TabHeader(tab: tab)
                ConceptView(tab: tab)
                VarObservableDemo(tab: tab)
                VarObservableDiagram(tab: tab)
                KeyPoints(tab: tab)
            }
        }
        .contentMargins(.horizontal, 16)
        .background(tab.theme.backgroundColor)
    }
}

#Preview {
    VarObservableView(tab: .varObservable)
}
