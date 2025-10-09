//
//  HuntViewModel.swift
//  ScavengerHuntApp
//
//  Created by Abdulmohammad BAIG on 2025-10-09.
//

import SwiftUI

final class HuntViewModel: ObservableObject {
    @Published var places: [Place] = [
        Place(name: "City Park", address: "12 Greenway Ave", clue: "Look near the old oak tree."),
        Place(name: "Maple Cafe", address: "55 Main Street", clue: "Find the hidden syrup bottle!"),
        Place(name: "Sunset Theatre", address: "21 King Blvd", clue: "A movie poster hides your next clue."),
        Place(name: "Book Haven", address: "88 Queen St", clue: "Check the classics shelf."),
        Place(name: "Art Studio", address: "44 Canvas Lane", clue: "Behind the biggest painting."),
        Place(name: "River Dock", address: "77 Water Rd", clue: "By the red lifebuoy."),
        Place(name: "City Library", address: "9 Knowledge St", clue: "Under the history section."),
        Place(name: "Flower Market", address: "3 Garden Rd", clue: "Near the tulip stand."),
        Place(name: "Sky Gym", address: "45 Fit Ave", clue: "Look by the punching bag."),
        Place(name: "Golden Bakery", address: "18 Bread Ln", clue: "Smell the fresh croissants!")
    ]

    // how many have a photo captured
    var foundCount: Int { places.filter { $0.photoData != nil }.count }

    // rewards
    var rewardText: String {
        switch foundCount {
        case 10: return "🎉 Found all 10! Entered into the $5000 draw + 20% off"
        case 7...9: return "✅ 7+ found → 20% discount code"
        case 5...6: return "✅ 5+ found → 10% discount code"
        default: return "Find 5 for 10% off, 7 for 20%, all 10 for the grand-prize draw!"
        }
    }
}
