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
    private var searchController: UISearchController!
    
    private lazy var weatherContainerView: WeatherContainerView = {
        let temp = WeatherContainerView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
        viewModel.subscribeLocation()
        viewModel.requestLocation()
        
        viewModel.requestCompletion = { [weak self] result, title in
            self?.title = title
            self?.weatherContainerView.setData(by: result)
            self?.weatherContainerView.hourlyWeatherCardView.reloadData()
        }
    }
    
    override func addViewComponents() {
        view.addSubview(weatherContainerView)
        
        NSLayoutConstraint.activate([
            weatherContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            weatherContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            weatherContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            weatherContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10.0)
        ])
    }
}

extension MainPageViewController {
    private func setupSearchController() {
        let searchControllerViewModel = SearchControllerViewModel()
        searchController = SearchController(viewModel: searchControllerViewModel)
        navigationItem.searchController = searchController
    }
}
