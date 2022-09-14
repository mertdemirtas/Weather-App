//
//  MainScreenViewModel.swift
//  Weather App
//
//  Created by Mert Demirtaş on 13.09.2022.
//

import Foundation
import CoreLocation

class MainPageViewModel: BaseViewModel {
    private let networkManager = NetworkManager()
    private let locationManager = LocationManager()
    public var status: LocationEnum?
    var dataClosure: ((WeatherContainerViewData) -> (Void))?
    
    
    public func requestLocationPermission() {
        locationManager.controlLocationPermission(completionHandler: { [weak self] result in
            self?.status = result
        })
    }
    
    public func getLocationStatus() -> LocationEnum? {
        return status
    }
    
    func getData() {
        getLocation()
    }
    
    private func getLocation() {
        locationManager.requestLocationPermission()
        let currentLocation = locationManager.getLocation()
        prepareGeoPositionSearch(currentLocation: currentLocation)
    }
    
    private func prepareGeoPositionSearch(currentLocation: CLLocationCoordinate2D) {
        let request = SearchByLocationRequest(location: currentLocation)
        fetchData(request: request)
    }
    
    private func fetchData(request: Endpoint) {
        networkManager.request(from: request, completionHandler: { [weak self] (result: CityByLocationModel) in
            self?.prepareWeatherRequest(locationID: result.key)
        })
    }
    
    private func prepareWeatherRequest(locationID: String?) {
        let request = CurrentConditionsRequest(locationID: locationID ?? "")
        getWeatherData(request: request)
    }
    
    private func getWeatherData(request: Endpoint) {
        networkManager.request(from: request, completionHandler: { [weak self] (result: CurrentConditionsModel) in
            self?.bindData(data: result)
        })
    }
    
    private func bindData(data: CurrentConditionsModel) {
        print(data)
    }
}
