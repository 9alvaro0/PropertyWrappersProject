//
//  ContentView.swift
//  PropertyWrappersProject
//
//  Created by Alvaro Guerra Freitas on 6/3/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .state
    @State private var showSnackbar = false
    @State private var snackbarTimer: Timer?
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(Tab.allCases, id: \.self) { tab in
                tab.view
                    .tag(tab)
            }
        }
        .tint(selectedTab.theme.primaryColor)
        .onChange(of: selectedTab) {
            withAnimation {
                showSnackbar = true
                startSnackbarTimer()
            }
        }
        .overlay(alignment: .bottom) {
            if showSnackbar {
                Snackbar(tab: selectedTab)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                    .animation(.spring(), value: showSnackbar)
                    .padding(.bottom, 70)
            }
        }
    }
    
    func startSnackbarTimer() {
        snackbarTimer?.invalidate()
        snackbarTimer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { _ in
            withAnimation { showSnackbar = false }
        }
    }
}

#Preview {
    ContentView()
}
