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
        let viewModel = MainPageViewModel()
        let vc = MainPageViewController(viewModel: viewModel)
        vc.title = "Tuzla"
        return vc
    }
}
