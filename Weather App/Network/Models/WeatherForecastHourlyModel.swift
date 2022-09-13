//
//  WeatherForecastHourlyModel.swift
//  Weather App
//
//  Created by Mert Demirtaş on 13.09.2022.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let weatherForecastHourlyModel = try? newJSONDecoder().decode(WeatherForecastHourlyModel.self, from: jsonData)

import Foundation

// MARK: - WeatherForecastHourlyModelElement
struct WeatherForecastHourlyModelElement: Codable {
    let dateTime: Date?
    let epochDateTime, weatherIcon: Int?
    let iconPhrase: IconPhrase?
    let hasPrecipitation, isDaylight: Bool?
    let temperature, realFeelTemperature, realFeelTemperatureShade, wetBulbTemperature: Ceiling?
    let dewPoint: Ceiling?
    let wind: Wind?
    let windGust: WindGust?
    let relativeHumidity, indoorRelativeHumidity: Int?
    let visibility, ceiling: Ceiling?
    let uvIndex: Int?
    let uvIndexText: UVIndexText?
    let precipitationProbability, thunderstormProbability, rainProbability, snowProbability: Int?
    let iceProbability: Int?
    let totalLiquid, rain, snow, ice: Ceiling?
    let cloudCover: Int?
    let evapotranspiration, solarIrradiance: Ceiling?
    let mobileLink, link: String?

    enum CodingKeys: String, CodingKey {
        case dateTime = "DateTime"
        case epochDateTime = "EpochDateTime"
        case weatherIcon = "WeatherIcon"
        case iconPhrase = "IconPhrase"
        case hasPrecipitation = "HasPrecipitation"
        case isDaylight = "IsDaylight"
        case temperature = "Temperature"
        case realFeelTemperature = "RealFeelTemperature"
        case realFeelTemperatureShade = "RealFeelTemperatureShade"
        case wetBulbTemperature = "WetBulbTemperature"
        case dewPoint = "DewPoint"
        case wind = "Wind"
        case windGust = "WindGust"
        case relativeHumidity = "RelativeHumidity"
        case indoorRelativeHumidity = "IndoorRelativeHumidity"
        case visibility = "Visibility"
        case ceiling = "Ceiling"
        case uvIndex = "UVIndex"
        case uvIndexText = "UVIndexText"
        case precipitationProbability = "PrecipitationProbability"
        case thunderstormProbability = "ThunderstormProbability"
        case rainProbability = "RainProbability"
        case snowProbability = "SnowProbability"
        case iceProbability = "IceProbability"
        case totalLiquid = "TotalLiquid"
        case rain = "Rain"
        case snow = "Snow"
        case ice = "Ice"
        case cloudCover = "CloudCover"
        case evapotranspiration = "Evapotranspiration"
        case solarIrradiance = "SolarIrradiance"
        case mobileLink = "MobileLink"
        case link = "Link"
    }
}

// MARK: - Ceiling
struct Ceiling: Codable {
    let value: Double?
    let unit: Unit?
    let unitType: Int?
    let phrase: Phrase?

    enum CodingKeys: String, CodingKey {
        case value = "Value"
        case unit = "Unit"
        case unitType = "UnitType"
        case phrase = "Phrase"
    }
}

enum Phrase: String, Codable {
    case cool = "Cool"
    case pleasant = "Pleasant"
}

enum Unit: String, Codable {
    case c = "C"
    case cm = "cm"
    case km = "km"
    case kmH = "km/h"
    case m = "m"
    case mm = "mm"
    case wM = "W/m²"
}

enum IconPhrase: String, Codable {
    case clear = "Clear"
    case cloudy = "Cloudy"
    case mostlyClear = "Mostly clear"
}

enum UVIndexText: String, Codable {
    case low = "Low"
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Ceiling?
    let direction: Direction?

    enum CodingKeys: String, CodingKey {
        case speed = "Speed"
        case direction = "Direction"
    }
}

// MARK: - Direction
struct Direction: Codable {
    let degrees: Int?
    let localized, english: String?

    enum CodingKeys: String, CodingKey {
        case degrees = "Degrees"
        case localized = "Localized"
        case english = "English"
    }
}

// MARK: - WindGust
struct WindGust: Codable {
    let speed: Ceiling?

    enum CodingKeys: String, CodingKey {
        case speed = "Speed"
    }
}

typealias WeatherForecastHourlyModel = [WeatherForecastHourlyModelElement]

