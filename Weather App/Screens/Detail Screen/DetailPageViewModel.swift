//
//  DetailPageViewModel.swift
//  Weather App
//
//  Created by Mert Demirtaş on 15.09.2022.
//

import Foundation

class DetailPageViewModel: BaseViewModel {
    private let formatter = MainPageFormatter()

    var completion: ((WeatherContainerViewData, String) -> (Void))?
    
    let keyValue: String
    let viewControllerTitle: String
    
    init(keyValue: String, viewControllerTitle: String) {
        self.keyValue = keyValue
        self.viewControllerTitle = viewControllerTitle
        super.init()
        prepareRequest()
    }
    
    private func prepareRequest() {
        let request = HourlyWeatherForecastRequest(locationID: keyValue)
        getWeatherData(request: request)
    }
    
    private func getWeatherData(request: Endpoint) {
        networkManager.request(from: request, completionHandler: { [weak self] (result: WeatherForecastHourlyModel) in
            self?.bindData(result: result)
        })
    }
    
    private func bindData(result: WeatherForecastHourlyModel) {
        let formattedResult = formatter.formatDataToWeatherContainerViewData(data: result)
        completion?(formattedResult, viewControllerTitle)
    }
}
