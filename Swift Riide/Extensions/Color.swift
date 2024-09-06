//
//  Color.swift
//  Swift Riide
//
//  Created by Zain Malik on 06/09/2024.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorThem()
}

struct ColorThem{
    let backgroundColor = Color("BackgroundColor")
    let secondaryBackgroundColor = Color("SecondaryBackgroundColor")
    let primaryTextColor = Color("PrimaryTextColor")

}
