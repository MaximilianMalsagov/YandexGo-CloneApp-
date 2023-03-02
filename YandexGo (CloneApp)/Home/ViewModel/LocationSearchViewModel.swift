//
//  LocationSearchViewModel.swift
//  YandexGo (CloneApp)
//
//  Created by Максимилиан Мальсагов on 27.02.2023.
//

import Foundation
import MapKit

class LocationSearchViewModel: NSObject, ObservableObject {
    
    @Published var results = [MKLocalSearchCompletion]()
    @Published var selectedYandexLocation : YandexLocation?
    @Published var pickupTime : String?
    @Published var droppOffTime : String?

    private let searchCompleter = MKLocalSearchCompleter()
    
    var queryFragment : String = "" {
        
        didSet {
            searchCompleter.queryFragment = queryFragment
        }
    }
    var userLocation : CLLocationCoordinate2D?
    
    override init() {
        super.init()
        
        searchCompleter.delegate = self
        searchCompleter.queryFragment = queryFragment
    }
    
    
    func selectLocation( _ localSearch: MKLocalSearchCompletion) {
        locationSearch(forLocalSearchCompletion: localSearch) { response, error in
            if let error = error {
                print("DEBUG: Location search failed with error \(error.localizedDescription)")
                return
            }
            guard let item = response?.mapItems.first else { return }
            let coordinate = item.placemark.coordinate
            self.selectedYandexLocation = YandexLocation(title: localSearch.title,
                                                         coordinate: coordinate)
            print("DEBUG : Location coordinates \(coordinate)")
        }
    }
    func locationSearch(forLocalSearchCompletion localSearch: MKLocalSearchCompletion, completion: @escaping MKLocalSearch.CompletionHandler)  {
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = localSearch.title.appending(localSearch.subtitle)
        let search = MKLocalSearch(request: searchRequest)
        
        search.start(completionHandler: completion)
    }
    
    func computeRidePrice(forType type: RideType) -> Double {
        guard let destCoordinate = selectedYandexLocation?.coordinate else { return 0.0 }
        guard let userCoordinate = self.userLocation  else { return 0.0 }
        
        let userLocation = CLLocation(latitude: userCoordinate.latitude,
                                      longitude: userCoordinate.longitude)
        let destination = CLLocation(latitude: destCoordinate.latitude,
                                     longitude: destCoordinate.longitude)
        
        let tripDistanceInMeters = userLocation.distance(from: destination)
        
        return type.computePrice(for: tripDistanceInMeters)
    }
        func getDestinationRoute(from userLocation: CLLocationCoordinate2D,
                                to destination: CLLocationCoordinate2D,
                                completion: @escaping(MKRoute) -> Void) {
        
        let userPlacemark = MKPlacemark(coordinate: userLocation)
        let destPlacemark = MKPlacemark(coordinate: destination)
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: userPlacemark)
        request.destination = MKMapItem(placemark: destPlacemark)
        
        let directions = MKDirections(request: request)
        
        
        directions.calculate { response , error in
            if let error = error {
                print("DEBUG \(error.localizedDescription)")
                return
            }
            guard let route = response?.routes.first else { return }
            self.configurePickupAndDroppoffTimes(with: route.expectedTravelTime)
            completion(route)
        }
    }
        func configurePickupAndDroppoffTimes(with expectedTravelTime: Double) {
            let formatter = DateFormatter()
            formatter.dateFormat = "hh:mm a"
            
            pickupTime = formatter.string(from: Date())
            droppOffTime = formatter.string(from: Date() + expectedTravelTime)
            
        }
}
    
extension LocationSearchViewModel : MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
    }
}
