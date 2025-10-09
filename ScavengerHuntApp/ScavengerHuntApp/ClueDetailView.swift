//
//  ClueDetailView.swift
//  ScavengerHuntApp
//
//  Created by Abdulmohammad BAIG on 2025-10-04.
//

import SwiftUI
import PhotosUI

struct ClueDetailView: View {
    @Binding var clue: Clue
    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedImage: UIImage?

    var body: some View {
        VStack(spacing: 20) {
            
            // Flip Card for Hint
            ZStack {
                if clue.flipped {
                    Text(clue.hint)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.yellow)
                        .cornerRadius(12)
                        .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                } else {
                    Text("Tap to reveal clue")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
            }
            .onTapGesture {
                withAnimation {
                    clue.flipped.toggle()
                }
            }

            // Show found image if available
            if let image = clue.foundImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .cornerRadius(10)
            }

            // Photo Picker Button
            PhotosPicker("📸 Take/Choose Photo",
                         selection: $selectedItem,
                         matching: .images)
            .buttonStyle(.borderedProminent)
            .padding()

        }
        .padding()
        .onChange(of: selectedItem) { _, newItem in
            Task {
                if let data = try? await newItem?.loadTransferable(type: Data.self),
                   let uiImage = UIImage(data: data) {
                    selectedImage = uiImage
                    clue.foundImage = uiImage
                }
            }
        }
    }
}
