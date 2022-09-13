//
//  MainScreenViewController.swift
//  Weather App
//
//  Created by Mert Demirtaş on 13.09.2022.
//

import Foundation
import UIKit

class MainPageViewController: BaseViewController<MainPageViewModel> {
    // MARK: Components
    private lazy var weatherContainerView: WeatherContainerView = {
        let temp = WeatherContainerView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherContainerView.setData(by: WeatherContainerViewData(date: "12 Haz 2022", detailData: WeatherDetailData(imageNumber: 1, temperatureValue: 21, weatherPhase: "Bulutlu"), atmosphericEventsData: AtmosphericEventsCardViewData(rainValue: 70, humidityValue: 23, windValue: 15)))
    }
    
    override func addViewComponents() {
        view.addSubview(weatherContainerView)
        
        NSLayoutConstraint.activate([
            weatherContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            weatherContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            weatherContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}
