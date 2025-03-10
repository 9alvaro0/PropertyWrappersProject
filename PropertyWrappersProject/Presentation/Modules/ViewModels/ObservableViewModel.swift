//
//  Observable.swift
//  PropertyWrappersProject
//
//  Created by Alvaro Guerra Freitas on 7/3/25.
//

import SwiftUI

@Observable class ObservableViewModel {
    var username: String = "Invitado"
    var count: Int = 0
    
    func increment() {
        count += 1
    }
}
