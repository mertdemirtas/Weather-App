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
        viewModel.getData()
        
        viewModel.completion = { [weak self] result in
            self?.weatherContainerView.setData(by: result)
            self?.weatherContainerView.hourlyWeatherCardView.reloadData()
        }
    }
    
    private func setupSearchController() {
        let searchResultViewModel = SearchControllerResultViewModel()
        let searchControllerResultViewController = SearchControllerResultViewController(viewModel: searchResultViewModel)
        let searchControllerViewModel = SearchControllerViewModel()
        searchController = SearchController(searchResultsController: searchControllerResultViewController, viewModel: searchControllerViewModel)
        navigationItem.searchController = searchController
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
