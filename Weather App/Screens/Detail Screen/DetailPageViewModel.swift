//
//  DetailPageViewModel.swift
//  Weather App
//
//  Created by Mert Demirtaş on 15.09.2022.
//

import Foundation

class DetailPageViewModel: BaseViewModel {
    let keyValue: String
    
    init(keyValue: String) {
        self.keyValue = keyValue
        super.init()
        prepareRequest()
    }
    
    private func prepareRequest() {
        let request = HourlyWeatherForecastRequest(locationID: keyValue)
        getData(request: request)
    }
    
    private func getData(request: Endpoint) {
        
    }
}
