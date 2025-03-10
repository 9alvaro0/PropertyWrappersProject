//
//  ObservedObjectObservableObjectView.swift
//  PropertyWrappersProject
//
//  Created by Alvaro Guerra Freitas on 6/3/25.
//

import SwiftUI

struct ObservedObjectObservableObjectView: View {
    let tab: Tab
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 24) {
                TabHeader(tab: tab)
                ConceptView(tab: tab)
                ObservedObjectObservableObjectDemo(tab: tab)
                ObservedObjectObservableObjectDiagram(tab: tab)
                KeyPoints(tab: tab)
            }
        }
        .contentMargins(.horizontal, 16)
        .background(tab.theme.backgroundColor)
    }
}

#Preview {
    ObservedObjectObservableObjectView(tab: .observedObjectObservableObject)
}
