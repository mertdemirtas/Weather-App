//
//  CurrentConditionsRequest.swift
//  Weather App
//
//  Created by Mert Demirtaş on 14.09.2022.
//

import Foundation
import Alamofire

class CurrentConditionsRequest: Endpoint {
    var networkConstants: NetworkConstants = AccuWeatherNetworkConstants.init()
    var httpMethod: HTTPMethods = HTTPMethods.get
    var path: String?
    var headers: HTTPHeaders? = nil
    var body: [String : Any]?
    
    private var locationID: String
    
    init(locationID: String) {
        self.locationID = locationID
        preparePath()
    }
    
    private func preparePath() {
        path = "currentconditions/v1/" + "\(locationID)" + "?apikey=\(networkConstants.apiKey)" + "&details=true"
    }
}
