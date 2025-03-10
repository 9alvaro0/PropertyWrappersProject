//
//  StateView.swift
//  PropertyWrappersProject
//
//  Created by Alvaro Guerra Freitas on 6/3/25.
//

import SwiftUI

struct StateView: View {
    let tab: Tab
    @State private var count: Int = 0
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 24) {
                TabHeader(tab: tab)
                ConceptView(tab: tab)
                StateDemo(tab: tab, count: $count)
                StateDiagram(tab: tab, count: count)
                KeyPoints(tab: tab)
            }
        }
        .contentMargins(.horizontal, 16)
        .background(tab.theme.backgroundColor)
    }
}

#Preview {
    StateView(tab: .state)
}
