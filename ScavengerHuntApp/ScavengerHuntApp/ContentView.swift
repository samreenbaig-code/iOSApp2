//
//  ContentView.swift
//  ScavengerHuntApp
//
//  Created by Abdulmohammad BAIG on 2025-10-04.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm: HuntViewModel
    @State private var showResults = false

    var body: some View {
        NavigationStack {
            VStack {
                // progress like FruitList header rows
                VStack(spacing: 8) {
                    Text("Progress: \(vm.foundCount)/\(vm.places.count)")
                        .font(.headline)
                    ProgressView(value: Double(vm.foundCount), total: Double(vm.places.count))
                }
                .padding(.horizontal)

                List {
                    ForEach(vm.places) { place in
                        NavigationLink(value: place) {
                            PlaceRow(place: place, found: place.photoData != nil)
                        }
                    }
                }
                .navigationTitle("🏆 Scavenger Hunt")
                .navigationDestination(for: Place.self) { place in
                    PlaceCardView(place: place)
                }
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Results") { showResults = true }
                    }
                }
            }
        }
        .sheet(isPresented: $showResults) {
            ResultsView()
                .presentationDetents([.medium, .large])
        }
    }
}
