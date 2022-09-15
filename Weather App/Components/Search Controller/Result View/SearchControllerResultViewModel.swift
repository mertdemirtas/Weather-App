//
//  SearchControllerResultViewModel.swift
//  Weather App
//
//  Created by Mert Demirtaş on 14.09.2022.
//

import Foundation
import RxRelay

class SearchControllerResultViewModel: BaseViewModel {
    private let networkManager = NetworkManager()
    var itemsToDisplay = BehaviorRelay<[SearchControllerCellCardViewData]>(value: [])
 //   var items =  [SearchControllerCellCardViewData]()
    
    public func prepareWeatherRequest(searchText: String?) {
        guard let searchText = searchText else { return }
        let request = GetCitiesRequest(searchText: searchText)
        getCities(request: request)
    }
    
    private func getCities(request: Endpoint) {
        networkManager.request(from: request, completionHandler: { [weak self] (result: CitiesModel) in
            self?.bindData(result: result)
        })
    }
    
    private func bindData(result: CitiesModel) {
        let formattedResult = SearchControllerResultViewControllerFormatter.citiesModelToSearchControllerCellCardViewData(citiesModel: result)
        itemsToDisplay.accept(formattedResult)
    }
}
