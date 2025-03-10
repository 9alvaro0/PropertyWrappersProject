//
//  ObservableObjectViewModel.swift
//  PropertyWrappersProject
//
//  Created by Alvaro Guerra Freitas on 7/3/25.
//

import SwiftUI

class ObservableObjectViewModel: ObservableObject {
    @Published var username: String = "Invitado"
    @Published var count: Int = 0
    
    func increment() {
        count += 1
    }
    
    func updateUsername() {
        username = "Usuario_\(Int.random(in: 1...100))"
    }
}
