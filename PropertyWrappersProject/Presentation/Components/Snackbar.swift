//
//  Snackbar.swift
//  PropertyWrappersProject
//
//  Created by Alvaro Guerra Freitas on 7/3/25.
//

import SwiftUI

struct Snackbar: View {
    let tab: Tab
    @State private var isVisible: Bool = true
    
    var body: some View {
        if isVisible {
            HStack {
                VStack(alignment: .leading) {
                    Text(tab.title)
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Text(tab.subtitle)
                        .font(.caption)
                        .foregroundColor(.primary.opacity(0.7))
                }
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        isVisible = false
                    }
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.white)
                        .padding(8)
                }
            }
            .padding()
            .background(tab.theme.primaryColor)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: 10)
            .frame(maxWidth: 300)
            .transition(.move(edge: .bottom).combined(with: .opacity))
        }
    }
}

#Preview {
    Snackbar(tab: .binding)
}
