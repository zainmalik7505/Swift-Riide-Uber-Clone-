//
//  MapViewRepresentable.swift
//  Swift Riide
//
//  Created by Zain Malik on 02/09/2024.
//

import SwiftUI
import MapKit


struct MapViewRepresentable: UIViewRepresentable{
    
    let mapView = MKMapView()
    let locationManager = LocationManager()
    
    func makeUIView(context: Context) -> some UIView {
        mapView.delegate = context.coordinator
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        return mapView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    
    func makeCoordinator() -> MapCoordinates {
        return MapCoordinates(parent: self)
    }
}

extension MapViewRepresentable{
    
    class MapCoordinates: NSObject, MKMapViewDelegate{
        let parent : MapViewRepresentable
        
        init(parent: MapViewRepresentable) {
            self.parent = parent
            super.init()
        }
        
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
            
            parent.mapView.setRegion(region, animated: true)
        }
    }
}
