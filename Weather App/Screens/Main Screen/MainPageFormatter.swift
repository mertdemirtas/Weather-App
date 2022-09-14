//
//  MainPageFormatter.swift
//  Weather App
//
//  Created by Mert Demirtaş on 14.09.2022.
//

import Foundation

class MainPageFormatter {
    class func formatDataToWeatherContainerViewData(data: WeatherForecastHourlyModel) -> WeatherContainerViewData {
        let currentCondition = data.first
        let detailData = WeatherDetailData(imageNumber: currentCondition?.weatherIcon ?? 0, temperatureValue: currentCondition?.temperature?.value ?? 0, weatherPhase: currentCondition?.iconPhrase ?? "")
        let currentAtmosphericData = AtmosphericEventsCardViewData(rainValue: currentCondition?.precipitationProbability ?? 0, humidityValue: currentCondition?.relativeHumidity ?? 0, windValue: currentCondition?.wind?.speed?.value ?? 0)
        
        var hourlyWeathersData = HourlyWeatherCardViewData(items: [HourlyWeatherCellData]())
        for element in data {
            hourlyWeathersData.items.append(HourlyWeatherCellData(time: element.dateTime ?? "", imageNumber: element.weatherIcon ?? 0, temperatureValue: element.temperature?.value ?? 0))
        }
        return WeatherContainerViewData(date: currentCondition?.dateTime ?? "", detailData: detailData, atmosphericEventsData: currentAtmosphericData, hourlyWeatherData: hourlyWeathersData)
    }
}
