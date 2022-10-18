//
//  Color.swift
//  CryptoTracker
//
//  Created by Udin Rajkarnikar on 10/13/22.
//

import Foundation
import SwiftUI

struct ColorTheme {
    
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("GreenColor")
    let red = Color("RedColor")
    let secondary = Color("SecondaryTextColor")
    
}

extension Color {
    
    static let theme = ColorTheme()
    
}
 
