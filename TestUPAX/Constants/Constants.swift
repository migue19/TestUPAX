//
//  Constants.swift
//  TestUPAX
//
//  Created by Miguel Mexicano Herrera on 23/12/22.
//

import Foundation

struct Endpoints {
    static var apiKey: String {
        return "3f1f490f46fbd48f90fbd64c39da2e60"
    }
    static var url: String {
        return "https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid=" + apiKey
    }
}
