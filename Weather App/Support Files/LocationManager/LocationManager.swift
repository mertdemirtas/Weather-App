//
//  LocationManager.swift
//  Pharmacy On-Duty
//
//  Created by Mert Demirtaş on 2.07.2022.
//

import Foundation
import CoreLocation

class LocationManager: CLLocationManager {
    private var status: LocationEnum?
    
    public func requestLocationPermission() {
        requestWhenInUseAuthorization()
        status = LocationEnum.init(permission: authorizationStatus)
    }
    
    public func controlLocationPermission(completionHandler: (LocationEnum) -> Void) {
        status = LocationEnum.init(permission: authorizationStatus)
        
        switch status {
        case .unusable:
            status = LocationEnum.init(permission: authorizationStatus)
            completionHandler(status ?? .unusable)
            
        case .usable:
            completionHandler(status ?? .usable)
            
        case .notDetermined:
            requestWhenInUseAuthorization()
            status = LocationEnum.init(permission: authorizationStatus)
            completionHandler(status ?? .notDetermined)
            
        case .none:
            requestWhenInUseAuthorization()
            status = LocationEnum.init(permission: authorizationStatus)
            completionHandler(status ?? .unusable)
            
        }
    }
    
    public func getStatus() -> LocationEnum {
        return status ?? .unusable
    }
    
    public func getLocation() -> CLLocationCoordinate2D {
        guard let location = location else { return CLLocationCoordinate2D() }
        return CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
    }
}
