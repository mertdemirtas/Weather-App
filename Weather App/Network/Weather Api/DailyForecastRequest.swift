//
//  DailyForecastRequest.swift
//  Weather App
//
//  Created by Mert Demirtaş on 13.09.2022.
//

import Foundation
import Alamofire

class DailyForecastRequest: Endpoint {
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
//        path = "characters/" + "\(characterId)" + "/comics" + "?ts=\(networkConstants.ts)" + "&apikey=\(networkConstants.apiKey)" + "&hash=\(networkConstants.hashKey)" + "&orderBy=onsaleDate" + "&limit=10"
    }
}

