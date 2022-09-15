//
//  SearchControllerResultViewFormatter.swift
//  Weather App
//
//  Created by Mert Demirtaş on 15.09.2022.
//

import Foundation

class SearchControllerResultViewControllerFormatter {
    class func citiesModelToSearchControllerCellCardViewData(citiesModel: CitiesModel) -> [SearchControllerCellCardViewData] {
        var data = [SearchControllerCellCardViewData]()
        for element in citiesModel {
            let firstWord = "\(element.localizedName ?? ""), \(element.administrativeArea?.localizedName ?? "")"
            data.append(SearchControllerCellCardViewData(firstWord: firstWord, key: element.key))
        }
        return data
    }
}
