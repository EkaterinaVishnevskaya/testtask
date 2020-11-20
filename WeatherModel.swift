//
//  WeatherModel.swift
//  testtask
//
//  Created by Екатерина Вишневская on 20.11.2020.
//

import Foundation

struct Weather: Codable {
    
    let request: Request
    let location: Location
    let current: Current
    
}

struct Request: Codable {
    let type:                String
    let query:               String
    let language:            String
    let unit:                String
}

struct Location: Codable {
    let name:                String
    let country:             String
    let region:              String
    let lat:                 String
    let lon:                 String
    let timezoneID:          String
    let localtime:           String
    let localtimeEpoch:      Double
    let utcOffset:           String
    
    enum CodingKeys: String, CodingKey {
        case name
        case country
        case region
        case lat
        case lon
        case timezoneID = "timezone_id"
        case localtime
        case localtimeEpoch = "localtime_epoch"
        case utcOffset = "utc_offset"
    }
}

struct Current: Codable {
    let observationTime:     String
    let temperature:         Double
    let weatherCode:         Double
    let weatherIcons:        [String]
    let weatherDescriptions: [String]
    let windSpeed:           Double
    let windDegree:          Double
    let windDir:             String
    let pressure:            Double
    let precip:              Double
    let humidity:            Double
    let cloudcover:          Double
    let feelslike:           Double
    let uvIndex:             Double
    let visibility:          Double
    let isDay:               String
    
    enum CodingKeys: String, CodingKey {
        case observationTime = "observation_time"
        case temperature
        case weatherCode = "weather_code"
        case weatherIcons = "weather_icons"
        case weatherDescriptions = "weather_descriptions"
        case windSpeed = "wind_speed"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case pressure
        case precip
        case humidity
        case cloudcover
        case feelslike
        case uvIndex = "uv_index"
        case visibility
        case isDay = "is_day"
    }
}
