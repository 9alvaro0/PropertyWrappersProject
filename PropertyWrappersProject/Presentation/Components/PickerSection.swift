//
//  PickerSection.swift
//  PropertyWrappersProject
//
//  Created by Alvaro Guerra Freitas on 7/3/25.
//

import SwiftUI

struct PickerSection: View {
    let tabs: [Tab]
    @Binding var selectedTab: Tab
    
    var body: some View {
        ForEach(tabs, id: \.self) { tab in
            LinkView(tab: tab)
        }
        .navigationDestination(for: Tab.self) { tab in
            if tab == .stateObjectObservableObject {
                ObservableObjectView(tab: tab)
            } else if tab == .stateObservable {
                ObservableView(tab: tab)
            } else if tab == .observedObjectObservableObject {
                ObservedObjectObservableObjectView(tab: tab)
            } else if tab == .varObservable {
                VarObservableView(tab: tab)
            } else if tab == .bindableObservable {
                BindableObservableView(tab: tab)
            }
        }
    }
}

#Preview {
    @Previewable
    @State var selectedTab: Tab = .stateObjectObservableObject
    PickerSection(
        tabs: [.stateObjectObservableObject, .stateObservable],
        selectedTab: $selectedTab
    )
}
