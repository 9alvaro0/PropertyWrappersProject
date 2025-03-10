//
//  LinkView.swift
//  PropertyWrappersProject
//
//  Created by Alvaro Guerra Freitas on 7/3/25.
//

import SwiftUI

struct LinkView: View {
    let tab: Tab
    
    var body: some View {
        NavigationLink(value: tab) {
            HStack {
                Text(tab.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
                    .font(.system(size: 14, weight: .semibold))
            }
            .padding(.vertical, 12)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(.systemBackground))
                    .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
            )
        }
        .buttonStyle(PlainButtonStyle())
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

#Preview {
    LinkView(tab: .binding)
}
