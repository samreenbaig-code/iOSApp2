//
//  LocationView.swift
//  ScavengerHuntApp
//
//  Created by Abdulmohammad BAIG on 2025-10-15.
//
import SwiftUI
import MapKit

struct LocationView: View {
    @StateObject private var locationManager = LocationManager()

    var body: some View {
        VStack {
            if let coordinate = locationManager.currentLocation {
                Map(coordinateRegion: .constant(
                    MKCoordinateRegion(
                        center: coordinate,
                        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                    )),
                    showsUserLocation: true,
                    annotationItems: [LocationPin(coordinate: coordinate)]
                ) { pin in
                    MapMarker(coordinate: pin.coordinate, tint: .red)
                }
                .mapStyle(.standard)
                .frame(height: 300)
                .cornerRadius(10)
                .padding()
            } else {
                Text("Fetching your location...")
                    .foregroundColor(.gray)
            }
        }
    }
}


