//
//  ResultsView.swift
//  ScavengerHuntApp
//
//  Created by Abdulmohammad BAIG on 2025-10-09.
//

import SwiftUI

struct ResultsView: View {
    @EnvironmentObject var vm: HuntViewModel
    @Environment(\.dismiss) var dismiss  // ✅ this lets you close the sheet

    var body: some View {
        VStack(spacing: 16) {
            Text("Results")
                .font(.title)
                .bold()

            Text("You found \(vm.foundCount) of \(vm.places.count) items.")
                .font(.headline)

            ProgressView(value: Double(vm.foundCount), total: Double(vm.places.count))
                .padding(.horizontal)

            Text(vm.rewardText)
                .multilineTextAlignment(.center)
                .padding()
                .background(.thinMaterial)
                .cornerRadius(12)

            Spacer()

            // ✅ Close button
            Button(action: {
                dismiss()  // this will close the sheet
            }) {
                Text("Close")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding(.horizontal)
            .padding(.bottom, 20)
        }
        .padding()
    }
}
