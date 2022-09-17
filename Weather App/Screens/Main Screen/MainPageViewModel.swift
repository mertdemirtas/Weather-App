//
//  MainScreenViewModel.swift
//  Weather App
//
//  Created by Mert Demirtaş on 13.09.2022.
//

import Foundation
import CoreLocation
import RxSwift

protocol MainPageViewModelDelegate : AnyObject {
    func showLocationPermissionPopup()
}

class MainPageViewModel: BaseViewModel {
    // MARK: Managers
    private let locationManager = LocationManager.shared
    
    // MARK: Formatter
    private let formatter = MainPageFormatter()
    
    private var viewControllerTitle = ""
    private let disposeBag = DisposeBag()
    
    // MARK: Closures
    public var locationClosure: (() -> Void)?
    var requestCompletion: ((WeatherContainerViewData, String) -> (Void))?
    
    // MARK: Delegate
    weak var delegate: MainPageViewModelDelegate?
    
    // MARK: Class Private functions
    func subscribeLocation() {
        _ = locationManager.status.subscribe(onNext: { [weak self] (status) in
            switch(status) {
            case .usable:
                self?.getLocation()
            case .notDetermined:
                break
            case .unusable:
                self?.delegate?.showLocationPermissionPopup()
            }
        }).disposed(by: disposeBag)
    }
    
    func requestLocation() {
        locationManager.requestLocationPermission()
    }
    
    private func getLocation() {
        let currentLocation = locationManager.getLocation()
        prepareGeoPositionSearch(currentLocation: currentLocation)
    }
    
    private func prepareGeoPositionSearch(currentLocation: CLLocationCoordinate2D) {
        let request = SearchByLocationRequest(location: currentLocation)
        fetchData(request: request)
    }
    
    private func fetchData(request: Endpoint) {
        networkManager.request(from: request, completionHandler: { [weak self] (result: CityByLocationModel) in
            self?.viewControllerTitle = result.localizedName ?? ""
            self?.prepareWeatherRequest(locationID: result.key)
        })
    }
    
    private func prepareWeatherRequest(locationID: String?) {
        let request = HourlyWeatherForecastRequest(locationID: locationID ?? "")
        getWeatherData(request: request)
    }
    
    private func getWeatherData(request: Endpoint) {
        networkManager.request(from: request, completionHandler: { [weak self] (result: WeatherForecastHourlyModel) in
            self?.bindData(result: result)
        })
    }
    
    private func bindData(result: WeatherForecastHourlyModel) {
        let formattedResult = formatter.formatDataToWeatherContainerViewData(data: result)
        
        requestCompletion?(formattedResult, viewControllerTitle)
    }
}
