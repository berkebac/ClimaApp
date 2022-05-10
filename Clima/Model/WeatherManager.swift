//
//  WeatherManager.swift
//  Clima
//
//  Created by Berke Baç on 10.05.2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=7921c2aa86467d381d0796199cb7ca4d&units=metric"
    
    func fetchWeather(cityName : String) {
        let urlString = "\(weatherUrl)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    self.parseJSON(weatherData: safeData)
                }
            }
            task.resume()
            
        }
    }
    
    func parseJSON(weatherData : Data) {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            
            print(decodedData.main.temp)
            print(decodedData.name)
            print(decodedData.weather[0].description)
        } catch {
            print(error)
        }
        
    }
    
}
