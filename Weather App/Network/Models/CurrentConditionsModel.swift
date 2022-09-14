//
//  CurrentConditionsModel.swift
//  Weather App
//
//  Created by Mert Demirtaş on 14.09.2022.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let currentConditionsModel = try? newJSONDecoder().decode(CurrentConditionsModel.self, from: jsonData)

import Foundation

// MARK: - CurrentConditionsModelElement
struct CurrentConditionsModelElement: Codable {
    let localObservationDateTime: String?
    let epochTime: Int?
    let weatherText: String?
    let weatherIcon: Int?
    let hasPrecipitation: Bool?
    let isDayTime: Bool?
    let temperature, realFeelTemperature, realFeelTemperatureShade: ApparentTemperature?
    let relativeHumidity, indoorRelativeHumidity: Int?
    let dewPoint: ApparentTemperature?
    let wind: Wind?
    let windGust: WindGust?
    let uvIndex: Int?
    let uvIndexText: String?
    let visibility: ApparentTemperature?
    let obstructionsToVisibility: String?
    let cloudCover: Int?
    let ceiling, pressure: ApparentTemperature?
    let pressureTendency: PressureTendency?
    let past24HourTemperatureDeparture, apparentTemperature, windChillTemperature, wetBulbTemperature: ApparentTemperature?
    let precip1Hr: ApparentTemperature?
    let precipitationSummary: [String: ApparentTemperature]?
    let temperatureSummary: TemperatureSummary?
    let mobileLink, link: String?

    enum CodingKeys: String, CodingKey {
        case localObservationDateTime = "LocalObservationDateTime"
        case epochTime = "EpochTime"
        case weatherText = "WeatherText"
        case weatherIcon = "WeatherIcon"
        case hasPrecipitation = "HasPrecipitation"
        case isDayTime = "IsDayTime"
        case temperature = "Temperature"
        case realFeelTemperature = "RealFeelTemperature"
        case realFeelTemperatureShade = "RealFeelTemperatureShade"
        case relativeHumidity = "RelativeHumidity"
        case indoorRelativeHumidity = "IndoorRelativeHumidity"
        case dewPoint = "DewPoint"
        case wind = "Wind"
        case windGust = "WindGust"
        case uvIndex = "UVIndex"
        case uvIndexText = "UVIndexText"
        case visibility = "Visibility"
        case obstructionsToVisibility = "ObstructionsToVisibility"
        case cloudCover = "CloudCover"
        case ceiling = "Ceiling"
        case pressure = "Pressure"
        case pressureTendency = "PressureTendency"
        case past24HourTemperatureDeparture = "Past24HourTemperatureDeparture"
        case apparentTemperature = "ApparentTemperature"
        case windChillTemperature = "WindChillTemperature"
        case wetBulbTemperature = "WetBulbTemperature"
        case precip1Hr = "Precip1hr"
        case precipitationSummary = "PrecipitationSummary"
        case temperatureSummary = "TemperatureSummary"
        case mobileLink = "MobileLink"
        case link = "Link"
    }
}

// MARK: - ApparentTemperature
struct ApparentTemperature: Codable {
    let metric, imperial: Imperial?

    enum CodingKeys: String, CodingKey {
        case metric = "Metric"
        case imperial = "Imperial"
    }
}

// MARK: - PressureTendency
struct PressureTendency: Codable {
    let localizedText, code: String?

    enum CodingKeys: String, CodingKey {
        case localizedText = "LocalizedText"
        case code = "Code"
    }
}

// MARK: - TemperatureSummary
struct TemperatureSummary: Codable {
    let past6HourRange, past12HourRange, past24HourRange: PastHourRange?

    enum CodingKeys: String, CodingKey {
        case past6HourRange = "Past6HourRange"
        case past12HourRange = "Past12HourRange"
        case past24HourRange = "Past24HourRange"
    }
}

// MARK: - PastHourRange
struct PastHourRange: Codable {
    let minimum, maximum: ApparentTemperature?

    enum CodingKeys: String, CodingKey {
        case minimum = "Minimum"
        case maximum = "Maximum"
    }
}

typealias CurrentConditionsModel = [CurrentConditionsModelElement]
