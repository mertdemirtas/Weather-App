//
//  SearchControllerResultViewFormatter.swift
//  Weather App
//
//  Created by Mert Demirtaş on 15.09.2022.
//

import Foundation

class SearchControllerFormatter {
    class func citiesModelToSearchControllerCellCardViewData(citiesModel: CitiesModel) -> [SearchControllerResultCellCardData] {
        var data = [SearchControllerResultCellCardData]()
        for element in citiesModel {
            let firstWord = "\(element.localizedName ?? ""), \(element.administrativeArea?.localizedName ?? "")"
            data.append(SearchControllerResultCellCardData(title: firstWord, key: element.key))
        }
        return data
    }
}
