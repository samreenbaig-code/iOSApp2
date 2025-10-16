import SwiftUI
import MapKit
import CoreLocation

// MARK: – Pin Struct
struct LocationPin: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

// MARK: – Main Map View
struct UserLocationMapView: View {
    @StateObject private var locationManager = LocationManager()

    var body: some View {
        let pin = LocationPin(coordinate: locationManager.currentLocation ?? CLLocationCoordinate2D(latitude: 0, longitude: 0))

        Map(coordinateRegion: .constant(
            MKCoordinateRegion(
                center: locationManager.currentLocation ?? CLLocationCoordinate2D(latitude: 0, longitude: 0),
                span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            )
        ),
        showsUserLocation: true,
        annotationItems: [pin]) { pin in
            MapMarker(coordinate: pin.coordinate, tint: .red)
        }
    }
}
