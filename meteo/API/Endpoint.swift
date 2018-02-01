//
//  Endpoint.swift
//  meteo
//
//  Created by Oscar on 2/1/18.
//  Copyright © 2018 oscartu. All rights reserved.
//

import Foundation

protocol Endpoint {
    var baseUrl: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
}

extension Endpoint {
    var urlComponent: URLComponents {
        var component = URLComponents(string: baseUrl)
        component?.path = path
        component?.queryItems = queryItems
        
        return component!
    }
    
    var request: URLRequest {
        return URLRequest(url: urlComponent.url!)
    }
}

enum WeatherEndpoint: Endpoint {
    case tenDayForecast(city: String, state: String)
    var baseUrl: String {
        return "http://api.wunderground.com"
    }
    
    var path: String {
        switch self {
        case .tenDayForecast(let city, let state):
            return "/api/4425170897ea00ae/forecast10day/q/\(state)/\(city).json"
        }
    }
    
    var queryItems: [URLQueryItem] {
        return []
    }
}
