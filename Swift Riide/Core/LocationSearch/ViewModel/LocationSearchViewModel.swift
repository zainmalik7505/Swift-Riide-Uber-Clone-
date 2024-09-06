//
//  LocationSearchViewModel.swift
//  Swift Riide
//
//  Created by Zain Malik on 03/09/2024.
//

import Foundation
import MapKit

class LocationSearchViewModel: NSObject, ObservableObject{
    
    // MARK: - Properties
    
    @Published var results = [MKLocalSearchCompletion]()
    @Published var selectedSwiftLocation: SwiftLocation?
    @Published var pickUpTime : String?
    @Published var dropOfTime : String?
    
    
    private let searchCompleter = MKLocalSearchCompleter()
    var queryFragment: String = "" {
        didSet{
            searchCompleter.queryFragment = queryFragment
        }
    }
    
    override init() {
        super.init()
        searchCompleter.delegate = self
        searchCompleter.queryFragment = queryFragment
    }
    
    var userLocation: CLLocationCoordinate2D?
    
    // MARK: - Helpers
    
    func selectLocation(_ localSearch: MKLocalSearchCompletion){
        locationSearch(forLocalSearchCompletion: localSearch) { response, error in
            if let error = error{
                print("Location failed : \(error.localizedDescription)")
                return
            }
            guard let item = response?.mapItems.first else { return }
            let coordinate = item.placemark.coordinate
            self.selectedSwiftLocation = SwiftLocation(title: localSearch.title, coordinate: coordinate)
            print("Location: \(coordinate)")
        }
    }
    
    func locationSearch(forLocalSearchCompletion localSearch: MKLocalSearchCompletion, completion: @escaping MKLocalSearch.CompletionHandler){
        
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = localSearch.title.appending(localSearch.subtitle)
        let search = MKLocalSearch(request: searchRequest)
        
        search.start(completionHandler: completion)
    }
    
    func computeRidePrice(forType type: RideType) -> Double{
        guard let destcoordinate = selectedSwiftLocation?.coordinate else { return 0.0 }
        guard let userCoordinate = self.userLocation else { return 0.0 }
        
        let userLocation = CLLocation(latitude: userCoordinate.latitude, longitude: userCoordinate.longitude)
        let destination = CLLocation(latitude: destcoordinate.latitude, longitude: destcoordinate.longitude)
        
        let tripDistanceInMeter = userLocation.distance(from: destination)
        return type.computePrice(for: tripDistanceInMeter)
    }
    
    func getDestinationRoute(from userLocation: CLLocationCoordinate2D, to destination: CLLocationCoordinate2D, completion: @escaping(MKRoute) -> Void){
        
        let userPlaceMark = MKPlacemark(coordinate: userLocation)
        let destinationPlaceMark = MKPlacemark(coordinate: destination)
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: userPlaceMark)
        request.destination = MKMapItem(placemark: destinationPlaceMark)
        let directions = MKDirections(request: request)
        
        directions.calculate { response, error in
            if let error = error{
                print("Failed to get direction \(error.localizedDescription)")
            }
            
            guard let route = response?.routes.first else { return }
            self.configPickUpAndDropOfTime(with: route.expectedTravelTime)
            completion(route)
            
        }
        
    }
    
    func configPickUpAndDropOfTime(with expectedTravelTime: Double){
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        
        pickUpTime  = formatter.string(from: Date())
        dropOfTime = formatter.string(from: Date() + expectedTravelTime)
        
    }
}


// MARK: = MKLocalSearchCompleterDelegate

extension LocationSearchViewModel: MKLocalSearchCompleterDelegate{
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
    }
}
