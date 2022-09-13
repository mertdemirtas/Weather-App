//
//  HourlyWeatherForecastRequest.swift
//  Weather App
//
//  Created by Mert Demirtaş on 13.09.2022.
//

import Foundation
import Alamofire

class HourlyWeatherForecastRequest: Endpoint {
    var networkConstants: NetworkConstants = AccuWeatherNetworkConstants.init()
    var httpMethod: HTTPMethods = HTTPMethods.get
    var path: String?
    var headers: HTTPHeaders? = nil
    var body: [String : Any]?
    
    private var locationID: Int
    
    init(locationID: Int) {
        self.locationID = locationID
        preparePath()
    }
    
    private func preparePath() {
        path = "forecasts/v1/hourly/12hour/" + "\(locationID)" + "?\(networkConstants.apiKey)" + "&details=true&metric=true"
    }
}



