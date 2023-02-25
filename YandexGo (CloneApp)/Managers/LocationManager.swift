//
//  LocationManager.swift
//  YandexGo (CloneApp)
//
//  Created by Максимилиан Мальсагов on 25.02.2023.
//

import CoreLocation

class LocationManager: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingHeading()
        locationManager.startUpdatingLocation()
    }
}

    extension LocationManager: CLLocationManagerDelegate {
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard !locations.isEmpty else { return }
            locationManager.stopUpdatingLocation()
        }
    }

