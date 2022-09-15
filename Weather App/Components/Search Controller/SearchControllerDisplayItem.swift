//
//  SearchControllerDisplayItem.swift
//  Weather App
//
//  Created by Mert Demirtaş on 15.09.2022.
//

import Foundation

enum SearchControllerDisplayItem {
    case searchedKeywords(data: SearchedKeywordsTableViewCellData)
    case result(data: SearchControllerResultCellCardData)
}
