//
//  SearchByLocationRequest.swift
//  Weather App
//
//  Created by Mert Demirtaş on 14.09.2022.
//

import Foundation
import Alamofire
import CoreLocation

class SearchByLocationRequest: Endpoint {
    var networkConstants: NetworkConstants = AccuWeatherNetworkConstants.init()
    var httpMethod: HTTPMethods = HTTPMethods.get
    var path: String?
    var headers: HTTPHeaders? = nil
    var body: [String : Any]?
    
    private var location: CLLocationCoordinate2D
    
    init(location: CLLocationCoordinate2D) {
        self.location = location
        preparePath()
    }
    
    private func preparePath() {
        path = "locations/v1/cities/geoposition/search" + "?apikey=\(networkConstants.apiKey)" + "&q=\(location.latitude),\(location.longitude)"
    }
}
