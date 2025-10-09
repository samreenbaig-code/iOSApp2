//
//  PlaceRow.swift
//  ScavengerHuntApp
//
//  Created by Abdulmohammad BAIG on 2025-10-07.
//

import SwiftUI

struct PlaceRow: View {
    let place: Place
    let found: Bool

    var body: some View {
        HStack {
            Image(systemName: found ? "checkmark.seal.fill" : "mappin.and.ellipse")
            VStack(alignment: .leading) {
                Text(place.name).font(.headline)
                Text(place.address).font(.subheadline).foregroundStyle(.secondary)
            }
            Spacer()
            if found {
                Text("Found").font(.caption).foregroundStyle(.green)
            }
        }
        .padding(.vertical, 4)
    }
}

