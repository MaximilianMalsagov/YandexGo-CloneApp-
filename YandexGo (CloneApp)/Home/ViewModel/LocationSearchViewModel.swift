//
//  LocationSearchViewModel.swift
//  YandexGo (CloneApp)
//
//  Created by Максимилиан Мальсагов on 27.02.2023.
//

import Foundation
import MapKit

class LocationSearchViewModel: NSObject, ObservableObject {
    
    @Published var results = [ MKLocalSearchCompletion()]
    @Published var selectedLocation: String?
    
    private let searchCompleter = MKLocalSearchCompleter()
    
    var queryFragment : String = "" {
        
    didSet {
        searchCompleter.queryFragment = queryFragment
    }
}
    override init() {
        super.init()
        
        searchCompleter.delegate = self
        searchCompleter.queryFragment = queryFragment
    }
    func selectLocation( _ location: String) {
        self.selectedLocation = location
        
        print("DEBUG: Selected location os \(self.selectedLocation)")
    }
}

extension LocationSearchViewModel : MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
    }
}
