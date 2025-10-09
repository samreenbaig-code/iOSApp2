//
//  Clue.swift
//  ScavengerHuntApp
//
//  Created by Abdulmohammad BAIG on 2025-10-04.
//

import Foundation
import SwiftUI

struct Clue: Identifiable {
    let id = UUID()
    let title: String
    let hint: String
    var foundImage: UIImage? = nil
    var flipped: Bool = false // ✅ per-clue flip state
}

