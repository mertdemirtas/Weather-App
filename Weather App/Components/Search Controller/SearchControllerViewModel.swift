//
//  SearchControllerView.swift
//  Weather App
//
//  Created by Mert Demirtaş on 14.09.2022.
//

import Foundation
import RxRelay

class SearchControllerViewModel {
    private let networkManager = NetworkManager()
    private let userDefaultsManager = UserDefaultsManager()
    var itemsToDisplay = BehaviorRelay<[SearchControllerCellCardViewData]>(value: [])

    func addSearchedWord(searchedWord: String) {
        userDefaultsManager.addData(searchedWord: searchedWord)
    }
    
    func getSearchedWords() {
        let searchedKeywords = userDefaultsManager.getData()
        var itemsArray = [SearchControllerCellCardViewData]()
        
        for element in searchedKeywords.reversed() {
            itemsArray.append(SearchControllerCellCardViewData(firstWord: element, key: ""))
        }
        itemsToDisplay.accept(itemsArray)
    }
    
    public func prepareWeatherRequest(searchText: String?) {
        guard let searchText = searchText else { return }
        addSearchedWord(searchedWord: searchText)
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
    
    func clearData() {
        let emptyArray = [SearchControllerCellCardViewData]()
        itemsToDisplay.accept(emptyArray)
    }
}
