//
//  LocationManager.swift
//  Pharmacy On-Duty
//
//  Created by Mert Demirtaş on 2.07.2022.
//

import Foundation
import CoreLocation
import RxSwift

class LocationManager: CLLocationManager {
    public var status = BehaviorSubject<LocationEnum>(value: .notDetermined)
    
    override init() {
        super.init()
        self.delegate = self
    }
    
    public func requestLocationPermission() {
        requestWhenInUseAuthorization()
    }
    
    public func getLocation() -> CLLocationCoordinate2D {
        guard let location = location else { return CLLocationCoordinate2D() }
        return CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager,
                         didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .restricted, .denied:
            self.status.onNext(LocationEnum.unusable)
            
        case .authorizedWhenInUse:
            self.status.onNext(LocationEnum.usable)
            
        case .authorizedAlways:
            self.status.onNext(LocationEnum.usable)
            
        case .notDetermined:
            self.status.onNext(LocationEnum.notDetermined)
            
        @unknown default:
            print("error")
        }
    }
}
