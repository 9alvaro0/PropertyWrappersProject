//
//  TabHeader.swift
//  PropertyWrappersProject
//
//  Created by Alvaro Guerra Freitas on 6/3/25.
//

import SwiftUI

struct TabHeader: View {
    let tab: Tab
    
    var body: some View {
        Text(tab.headerTitle)
            .font(.system(.largeTitle, design: .rounded, weight: .bold))
            .foregroundColor(tab.theme.primaryColor)
            .padding(.top)
            .multilineTextAlignment(.center)
    }
}

#Preview {
    TabHeader(tab: .state)
}
