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
    var completion: ((WeatherContainerViewData) -> (Void))?
    
    
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
        let request = HourlyWeatherForecastRequest(locationID: "1284832")
        getWeatherData(request: request)
    }
    
    private func getWeatherData(request: Endpoint) {
        networkManager.request(from: request, completionHandler: { [weak self] (result: WeatherForecastHourlyModel) in
            self?.bindData(result: result)
        })
    }
    
    private func bindData(result: WeatherForecastHourlyModel) {
        let formattedResult = MainPageFormatter.formatDataToWeatherContainerViewData(data: result)
        completion?(formattedResult)
    }
}
