//
//  TabTheme.swift
//  PropertyWrappersProject
//
//  Created by Alvaro Guerra Freitas on 6/3/25.
//

import SwiftUI

struct TabTheme {
    let primaryColor: Color
    let secondaryColor: Color
    let backgroundColor = Color(.systemBackground)
    let cardBackground = Color(.systemGray6)

    init(_ primary: Color, _ secondary: Color) {
        self.primaryColor = primary
        self.secondaryColor = secondary
    }
}
