//
//  MainScreenBuilder.swift
//  Weather App
//
//  Created by Mert Demirtaş on 13.09.2022.
//

import Foundation
import UIKit

class MainPageBuilder {
    class func build() -> UIViewController {
        let locationManager = LocationManager()
        let networkManager = NetworkManager()
        let viewModel = MainPageViewModel(networkManager: networkManager, locationManager: locationManager)
        let vc = MainPageViewController(viewModel: viewModel)
        return vc
    }
}
