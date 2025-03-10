//
//  StateDemo.swift
//  PropertyWrappersProject
//
//  Created by Alvaro Guerra Freitas on 7/3/25.
//

import SwiftUI

struct StateDemo: View {
    let tab: Tab
    @Binding var count: Int

    @State private var isAnimating: Bool = false
    
    var body: some View {
        CardView(tab: tab) {
            Text("Demostración Interactiva")
                .font(.system(.title2, design: .rounded, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(spacing: 20) {
                ZStack {
                    Circle()
                        .fill(tab.theme.primaryColor.opacity(0.2))
                        .frame(width: 120, height: 120)
                    
                    Circle()
                        .stroke(tab.theme.primaryColor, lineWidth: 3)
                        .frame(width: 120, height: 120)
                    
                    Text("\(count)")
                        .font(.system(size: 48, weight: .bold, design: .rounded))
                        .foregroundColor(tab.theme.primaryColor)
                        .scaleEffect(isAnimating ? 1.3 : 1.0)
                        .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isAnimating)
                }
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Contador: \(count)")
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    Text("Cada vez que el valor cambia, la vista se actualiza automáticamente")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    HStack(spacing: 12) {
                        Button(action: {
                            decrementWithAnimation()
                        }) {
                            Image(systemName: "minus")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(12)
                                .background(count > 0 ? tab.theme.secondaryColor : Color.gray)
                                .cornerRadius(8)
                        }
                        .disabled(count <= 0)
                        
                        Button(action: {
                            incrementWithAnimation()
                        }) {
                            Image(systemName: "plus")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(12)
                                .background(tab.theme.primaryColor)
                                .cornerRadius(8)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(tab.theme.backgroundColor)
            .cornerRadius(16)
        }
    }
    
    private func incrementWithAnimation() {
        withAnimation {
            isAnimating = true
            count += 1
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            isAnimating = false
        }
    }
    
    private func decrementWithAnimation() {
        withAnimation {
            isAnimating = true
            if count > 0 {
                count -= 1
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            isAnimating = false
        }
    }
}

#Preview {
    @Previewable
    @State var count = 0
    StateDemo(tab: .state, count: $count)
}
