//
//  CityByLocationModel.swift
//  Weather App
//
//  Created by Mert Demirtaş on 13.09.2022.
//

import Foundation

// MARK: - CityByLocationModel
struct CityByLocationModel {
    let version: Int?
    let key, type: String?
    let rank: Int?
    let localizedName, englishName, primaryPostalCode: String?
    let region, country: Country?
    let administrativeArea: AdministrativeArea?
    let timeZone: TimeZone?
    let geoPosition: GeoPosition?
    let isAlias: Bool?
    let supplementalAdminAreas: [Any?]?
    let dataSets: [String]?
}

// MARK: - AdministrativeArea
struct AdministrativeArea {
    let id, localizedName, englishName: String?
    let level: Int?
    let localizedType, englishType, countryID: String?
}

// MARK: - Country
struct Country {
    let id, localizedName, englishName: String?
}

// MARK: - GeoPosition
struct GeoPosition {
    let latitude, longitude: Double?
    let elevation: Elevation?
}

// MARK: - Elevation
struct Elevation {
    let metric, imperial: Imperial?
}

// MARK: - Imperial
struct Imperial {
    let value: Int?
    let unit: String?
    let unitType: Int?
}

// MARK: - TimeZone
struct TimeZone {
    let code, name: String?
    let gmtOffset: Int?
    let isDaylightSaving: Bool?
    let nextOffsetChange: NSNull?
}
