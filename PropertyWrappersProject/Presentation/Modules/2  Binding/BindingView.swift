//
//  BindingView.swift
//  PropertyWrappersProject
//
//  Created by Alvaro Guerra Freitas on 6/3/25.
//

import SwiftUI

struct BindingView: View {
    let tab: Tab
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 24) {
                TabHeader(tab: tab)
                ConceptView(tab: tab)
                BindingDemo(tab: tab)
                BindingDiagram(tab: tab)
                KeyPoints(tab: tab)
            }
        }
        .contentMargins(.horizontal, 16)
        .background(tab.theme.backgroundColor)
    }
}

#Preview {
    BindingView(tab: .binding)
}
