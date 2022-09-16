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
        let viewModel = MainPageViewModel(locationManager: locationManager)
        let vc = MainPageViewController(viewModel: viewModel)
        vc.title = "Weather App"
        return vc
    }
}
