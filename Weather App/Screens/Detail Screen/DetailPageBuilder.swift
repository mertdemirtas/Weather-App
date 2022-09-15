//
//  DetailPageBuilder.swift
//  Weather App
//
//  Created by Mert Demirtaş on 15.09.2022.
//

import Foundation
import UIKit

class DetailPageBuilder {
    class func build(keyValue: String?) -> UIViewController {
        let viewModel = DetailPageViewModel(keyValue: keyValue ?? "")
        let viewController = DetailPageViewController(viewModel: viewModel)
        return viewController
    }
}
