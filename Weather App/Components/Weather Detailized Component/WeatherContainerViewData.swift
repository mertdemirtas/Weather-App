//
//  WeatherDetailizedContainerViewData.swift
//  Weather App
//
//  Created by Mert Demirtaş on 13.09.2022.
//

import Foundation

struct WeatherContainerViewData {
    let date: String
    let detailData: WeatherDetailData
    let atmosphericEventsData: AtmosphericEventsCardViewData
    let hourlyWeatherData: HourlyWeatherCardViewData
}
