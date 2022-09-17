//
//  SearchControllerView.swift
//  Weather App
//
//  Created by Mert Demirtaş on 14.09.2022.
//

import Foundation
import RxRelay

class SearchControllerViewModel {
    private let networkManager = NetworkManager.shared
    private let userDefaultsManager = UserDefaultsManager.shared
    var displayableList = BehaviorRelay<[SearchControllerDisplayItem]>(value: [])
    private var itemsToDisplay = [SearchControllerDisplayItem]()

    func addSearchedWord(searchedWord: String) {
        userDefaultsManager.addData(searchedWord: searchedWord)
    }
    
    func getSearchedWords() {
        clearData()
        let searchedKeywords = userDefaultsManager.getData()
        for element in searchedKeywords.reversed() {
            itemsToDisplay.append(SearchControllerDisplayItem.searchedKeywords(data: SearchedKeywordsTableViewCellData(searchedWordText: element)))
        }
        displayableList.accept(itemsToDisplay)
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
        clearData()
        let formattedResult = SearchControllerFormatter.citiesModelToSearchControllerCellCardViewData(citiesModel: result)
        for element in formattedResult {
            itemsToDisplay.append(SearchControllerDisplayItem.result(data: element))
        }
        displayableList.accept(itemsToDisplay)
    }
    
    func clearData() {
        itemsToDisplay.removeAll()
        displayableList.accept(itemsToDisplay)
    }
}
