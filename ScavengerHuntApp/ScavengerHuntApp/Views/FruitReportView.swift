//
//  FruitReportView.swift
//  ScavengerHuntApp
//
//  Created by Abdulmohammad BAIG on 2025-10-16.
//

import SwiftUI

struct FruitReportView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Fruit Report")
                .font(.title)
                .bold()

            Text("• Persimmon\n• Strawberry\n• Banana\n• Tomato\n• Pear")
                .font(.body)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
