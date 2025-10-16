//
//  HuntReportView.swift
//  ScavengerHuntApp
//
//  Created by Abdulmohammad BAIG on 2025-10-16.
//

import SwiftUI

struct HuntReportView: View {
    @EnvironmentObject var vm: HuntViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Scavenger Hunt Results")
                .font(.title)
                .bold()

            ForEach(vm.places) { place in
                HStack {
                    Text(place.name)
                        .foregroundColor(place.photoData != nil ? .green : .gray)
                    Spacer()
                    if let photo = place.photoData, let uiImage = UIImage(data: photo) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
            }
        }
        .padding()
    }
}
