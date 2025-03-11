//
//  ObservedObjectVsObservableVsBindableView.swift
//  PropertyWrappersProject
//
//  Created by Alvaro Guerra Freitas on 6/3/25.
//

import SwiftUI

struct ObservedObjectVsObservableVsBindableView: View {
    let tab: Tab
    let tabs: [Tab]
    
    @State private var selectedTab: Tab = .observedObjectObservableObject
    
    var body: some View {
        NavigationStack {
            ScrollViewReader { proxy in
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 24) {
                        TabHeader(tab: tab)
                            .padding(.horizontal, 16)
                        ConceptView(tab: tab)
                            .padding(.horizontal, 16)
                        PickerSection(
                            tabs: tabs,
                            selectedTab: $selectedTab
                        )
                        ComparisonSection4(
                            tab: tab,
                            tabs: tabs,
                            proxy: proxy
                        )
                    }
                }
                .contentMargins(16)
                .background(tab.theme.backgroundColor)
            }
        }
    }
}

