//
//  GetCitiesRequest.swift
//  Weather App
//
//  Created by Mert Demirtaş on 15.09.2022.
//

import Foundation
import Alamofire

class GetCitiesRequest: Endpoint {
    var networkConstants: NetworkConstants = AccuWeatherNetworkConstants.init()
    var httpMethod: HTTPMethods = HTTPMethods.get
    var path: String?
    var headers: HTTPHeaders? = nil
    var body: [String : Any]?
    
    private var searchText: String
    
    init(searchText: String) {
        self.searchText = searchText
        preparePath()
    }
    
    private func preparePath() {
        path = "locations/v1/cities/search" + "?apikey=\(networkConstants.apiKey)" + "&q=\(searchText)"
    }
}
