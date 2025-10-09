//
//  Place.swift
//  ScavengerHuntApp
//
//  Created by Abdulmohammad BAIG on 2025-10-07.
//

import Foundation

struct Place: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let address: String
    let clue: String

    // store a captured image as Data (lightweight persistence-ready)
    var photoData: Data? = nil
}

