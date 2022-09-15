//
//  SearchedKeywordsModel.swift
//  Weather App
//
//  Created by Mert Demirtaş on 15.09.2022.
//

import Foundation

struct SearchedKeywordsModel: Codable {
    let firstWord: String
    let key: String

    enum CodingKeys: String, CodingKey {
        case firstWord = "employeeId"
        case key = "key"
    }
}
