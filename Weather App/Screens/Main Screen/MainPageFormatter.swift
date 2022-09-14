//
//  MainPageFormatter.swift
//  Weather App
//
//  Created by Mert Demirtaş on 14.09.2022.
//

import Foundation

class MainPageFormatter {
    func formatDataToWeatherContainerViewData(data: WeatherForecastHourlyModel) -> WeatherContainerViewData {
        let currentCondition = data.first
        
        let convertedDate = convertDateFormater(date: currentCondition?.dateTime ?? "")
        
        let detailData = WeatherDetailData(imageNumber: currentCondition?.weatherIcon ?? 0, temperatureValue: currentCondition?.temperature?.value ?? 0, weatherPhase: currentCondition?.iconPhrase ?? "")
        
        let currentAtmosphericData = AtmosphericEventsCardViewData(rainValue: currentCondition?.precipitationProbability ?? 0, humidityValue: currentCondition?.relativeHumidity ?? 0, windValue: currentCondition?.wind?.speed?.value ?? 0)
        
        var hourlyWeathersData = HourlyWeatherCardViewData(items: [HourlyWeatherCellData]())
        
        for element in data {
            hourlyWeathersData.items.append(HourlyWeatherCellData(time: element.dateTime ?? "", imageNumber: element.weatherIcon ?? 0, temperatureValue: element.temperature?.value ?? 0))
        }
        
        return WeatherContainerViewData(date: convertedDate, detailData: detailData, atmosphericEventsData: currentAtmosphericData, hourlyWeatherData: hourlyWeathersData)
    }
}

extension MainPageFormatter {
    func convertDateFormater(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        dateFormatter.locale = .appLanguage

        guard let date = dateFormatter.date(from: date) else {
            return ""
        }

        dateFormatter.dateFormat = "E, MMMM, dd"
        dateFormatter.locale = Locale.current
        let timeStamp = dateFormatter.string(from: date)

        return timeStamp
    }
}
