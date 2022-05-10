//
//  WeatherData.swift
//  Clima
//
//  Created by Berke Baç on 10.05.2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData : Decodable {
    let name : String
    let main : Main
    let weather : [Weather]
}

struct Main : Decodable {
    let temp : Double
}
struct Weather : Decodable {
    let id : Int
    let description : String
    
}
