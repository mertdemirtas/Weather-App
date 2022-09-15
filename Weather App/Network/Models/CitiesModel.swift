//
//  CitiesModel.swift
//  Weather App
//
//  Created by Mert Demirtaş on 15.09.2022.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let citiesModel = try? newJSONDecoder().decode(CitiesModel.self, from: jsonData)

import Foundation

// MARK: - CitiesModelElement
struct CitiesModelElement: Codable {
    let version: Int?
    let key: String?
    let type: String?
    let rank: Int?
    let localizedName, englishName: String?
    let primaryPostalCode: String?
    let region, country: Country?
    let administrativeArea: AdministrativeArea?

    enum CodingKeys: String, CodingKey {
        case version = "Version"
        case key = "Key"
        case type = "Type"
        case rank = "Rank"
        case localizedName = "LocalizedName"
        case englishName = "EnglishName"
        case primaryPostalCode = "PrimaryPostalCode"
        case region = "Region"
        case country = "Country"
        case administrativeArea = "AdministrativeArea"
    }
}

typealias CitiesModel = [CitiesModelElement]
