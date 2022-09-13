//
//  WeatherForecastDaily.swift
//  Weather App
//
//  Created by Mert Demirtaş on 13.09.2022.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let weatherForecastDaily = try? newJSONDecoder().decode(WeatherForecastDaily.self, from: jsonData)

import Foundation

// MARK: - WeatherForecastDaily
struct WeatherForecastDaily: Codable {
    let headline: Headline?
    let dailyForecasts: [DailyForecast]?

    enum CodingKeys: String, CodingKey {
        case headline = "Headline"
        case dailyForecasts = "DailyForecasts"
    }
}

// MARK: - DailyForecast
struct DailyForecast: Codable {
    let date: Date?
    let epochDate: Int?
    let sun: Sun?
    let moon: Moon?
    let temperature, realFeelTemperature, realFeelTemperatureShade: RealFeelTemperature?
    let hoursOfSun: Double?
    let degreeDaySummary: DegreeDaySummary?
    let airAndPollen: [AirAndPollen]?
    let day, night: Day?
    let sources: [String]?
    let mobileLink, link: String?

    enum CodingKeys: String, CodingKey {
        case date = "Date"
        case epochDate = "EpochDate"
        case sun = "Sun"
        case moon = "Moon"
        case temperature = "Temperature"
        case realFeelTemperature = "RealFeelTemperature"
        case realFeelTemperatureShade = "RealFeelTemperatureShade"
        case hoursOfSun = "HoursOfSun"
        case degreeDaySummary = "DegreeDaySummary"
        case airAndPollen = "AirAndPollen"
        case day = "Day"
        case night = "Night"
        case sources = "Sources"
        case mobileLink = "MobileLink"
        case link = "Link"
    }
}

// MARK: - AirAndPollen
struct AirAndPollen: Codable {
    let name: String?
    let value: Int?
    let category: String?
    let categoryValue: Int?
    let type: String?

    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case value = "Value"
        case category = "Category"
        case categoryValue = "CategoryValue"
        case type = "Type"
    }
}

// MARK: - Day
struct Day: Codable {
    let icon: Int?
    let iconPhrase: String?
    let hasPrecipitation: Bool?
    let precipitationType, precipitationIntensity, shortPhrase, longPhrase: String?
    let precipitationProbability, thunderstormProbability, rainProbability, snowProbability: Int?
    let iceProbability: Int?
    let wind, windGust: Wind?
    let totalLiquid, rain, snow, ice: Evapotranspiration?
    let hoursOfPrecipitation, hoursOfRain, hoursOfSnow, hoursOfIce: Int?
    let cloudCover: Int?
    let evapotranspiration, solarIrradiance: Evapotranspiration?

    enum CodingKeys: String, CodingKey {
        case icon = "Icon"
        case iconPhrase = "IconPhrase"
        case hasPrecipitation = "HasPrecipitation"
        case precipitationType = "PrecipitationType"
        case precipitationIntensity = "PrecipitationIntensity"
        case shortPhrase = "ShortPhrase"
        case longPhrase = "LongPhrase"
        case precipitationProbability = "PrecipitationProbability"
        case thunderstormProbability = "ThunderstormProbability"
        case rainProbability = "RainProbability"
        case snowProbability = "SnowProbability"
        case iceProbability = "IceProbability"
        case wind = "Wind"
        case windGust = "WindGust"
        case totalLiquid = "TotalLiquid"
        case rain = "Rain"
        case snow = "Snow"
        case ice = "Ice"
        case hoursOfPrecipitation = "HoursOfPrecipitation"
        case hoursOfRain = "HoursOfRain"
        case hoursOfSnow = "HoursOfSnow"
        case hoursOfIce = "HoursOfIce"
        case cloudCover = "CloudCover"
        case evapotranspiration = "Evapotranspiration"
        case solarIrradiance = "SolarIrradiance"
    }
}

// MARK: - Evapotranspiration
struct Evapotranspiration: Codable {
    let value: Double?
    let unit: String?
    let unitType: Int?
    let phrase: String?

    enum CodingKeys: String, CodingKey {
        case value = "Value"
        case unit = "Unit"
        case unitType = "UnitType"
        case phrase = "Phrase"
    }
}

// MARK: - DegreeDaySummary
struct DegreeDaySummary: Codable {
    let heating, cooling: Evapotranspiration?

    enum CodingKeys: String, CodingKey {
        case heating = "Heating"
        case cooling = "Cooling"
    }
}

// MARK: - Moon
struct Moon: Codable {
    let rise: Date?
    let epochRise: Int?
    let moonSet: Date?
    let epochSet: Int?
    let phase: String?
    let age: Int?

    enum CodingKeys: String, CodingKey {
        case rise = "Rise"
        case epochRise = "EpochRise"
        case moonSet = "Set"
        case epochSet = "EpochSet"
        case phase = "Phase"
        case age = "Age"
    }
}

// MARK: - RealFeelTemperature
struct RealFeelTemperature: Codable {
    let minimum, maximum: Evapotranspiration?

    enum CodingKeys: String, CodingKey {
        case minimum = "Minimum"
        case maximum = "Maximum"
    }
}

// MARK: - Sun
struct Sun: Codable {
    let rise: Date?
    let epochRise: Int?
    let sunSet: Date?
    let epochSet: Int?

    enum CodingKeys: String, CodingKey {
        case rise = "Rise"
        case epochRise = "EpochRise"
        case sunSet = "Set"
        case epochSet = "EpochSet"
    }
}

// MARK: - Headline
struct Headline: Codable {
    let effectiveDate: Date?
    let effectiveEpochDate, severity: Int?
    let text, category: String?
    let endDate: Date?
    let endEpochDate: Int?
    let mobileLink, link: String?

    enum CodingKeys: String, CodingKey {
        case effectiveDate = "EffectiveDate"
        case effectiveEpochDate = "EffectiveEpochDate"
        case severity = "Severity"
        case text = "Text"
        case category = "Category"
        case endDate = "EndDate"
        case endEpochDate = "EndEpochDate"
        case mobileLink = "MobileLink"
        case link = "Link"
    }
}

