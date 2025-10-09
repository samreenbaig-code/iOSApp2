//
//  PlaceCardView.swift .swift
//  ScavengerHuntApp
//
//  Created by Abdulmohammad BAIG on 2025-10-07.
//

import SwiftUI

struct PlaceCardView: View {
    @EnvironmentObject var vm: HuntViewModel
    let place: Place
    
    @State private var isFlipped = false
    @State private var selectedImage: UIImage? = nil
    @State private var isPickerPresented = false
    @State private var useCamera = false
    
    var index: Int? {
        vm.places.firstIndex(of: place)
    }
    
    var body: some View {
        ZStack {
            if isFlipped {
                VStack(spacing: 16) {
                    if let selectedImage {
                        Image(uiImage: selectedImage)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 250)
                            .cornerRadius(10)
                    } else if let index = index,
                              let data = vm.places[index].photoData,
                              let img = UIImage(data: data) {
                        Image(uiImage: img)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 250)
                            .cornerRadius(10)
                    } else {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .foregroundStyle(.gray)
                    }
                    
                    HStack {
                        Button("📷 Camera") {
                            useCamera = true
                            isPickerPresented = true
                        }
                        .buttonStyle(.borderedProminent)
                        
                        Button("🖼 Library") {
                            useCamera = false
                            isPickerPresented = true
                        }
                        .buttonStyle(.bordered)
                    }
                    
                    Button("Flip Back") {
                        withAnimation(.spring()) {
                            isFlipped.toggle()
                        }
                    }
                    .padding(.top)
                }
                .padding()
                .background(Color.yellow.opacity(0.15))
                .cornerRadius(16)
                .shadow(radius: 6)
                .sheet(isPresented: $isPickerPresented, onDismiss: saveSelectedImageIfAny) {
                    PhotoPickerView(image: $selectedImage, useCamera: useCamera)
                }
            } else {
                VStack(spacing: 12) {
                    Text(place.name)
                        .font(.largeTitle)
                        .bold()
                    
                    Text(place.address)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    
                    Divider()
                    
                    VStack(spacing: 8) {
                        Text("🕵️‍♀️ Clue: \(place.clue)")
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        
                        if let index = index,
                           let data = vm.places[index].photoData,
                           let image = UIImage(data: data) {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 160)
                                .cornerRadius(10)
                                .padding(.top, 5)
                        }
                    }
                    
                    Button("Flip Card") {
                        withAnimation(.spring()) {
                            isFlipped.toggle()
                        }
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
                .background(Color.cyan.opacity(0.15))
                .cornerRadius(16)
                .shadow(radius: 6)
            }
        }
        .padding()
        .background(Color.cyan.opacity(0.15))
        .cornerRadius(16)
        .shadow(radius: 6)
        .navigationTitle(place.name)
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $isPickerPresented, onDismiss: saveSelectedImageIfAny) {
            PhotoPickerView(image: $selectedImage, useCamera: useCamera)
        }
    }

    // This must stay outside of body
    func saveSelectedImageIfAny() {
        guard let img = selectedImage,
              let data = img.jpegData(compressionQuality: 0.8),
              let index = index else {
            return
        }

        vm.places[index].photoData = data
    }
}
