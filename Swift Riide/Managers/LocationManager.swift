//
//  LocationManager.swift
//  Swift Riide
//
//  Created by Zain Malik on 02/09/2024.
//

import CoreLocation


class LocationManager: NSObject, ObservableObject{
    private let locationManager = CLLocationManager()
    static let shared = LocationManager()
    @Published var userLocation : CLLocationCoordinate2D?
    
    override init() {
        super.init()
        locationManager.delegate = self
        //Give us the most accurate possible location of user
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //Request user location and Permissions
        locationManager.requestWhenInUseAuthorization()
        //Update user location
        locationManager.startUpdatingLocation()
    }
}


extension LocationManager: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        self.userLocation = location.coordinate
        locationManager.stopUpdatingLocation()
    }
}
