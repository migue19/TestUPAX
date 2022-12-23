//
//  Constants.swift
//  TestUPAX
//
//  Created by Miguel Mexicano Herrera on 23/12/22.
//

import Foundation

struct OpenWeather {
    static var url: String {
        return "https://api.openweathermap.org/data/2.5/weather?lat=%7Blat%7D&lon=%7Blon%7D&appid={Apikey}"
    }
}
