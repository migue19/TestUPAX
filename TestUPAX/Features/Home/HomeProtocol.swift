//
//  HomeProtocol.swift
//  TestUPAX
//
//  Created by Miguel Mexicano Herrera on 23/12/22.
//  
//

/// Protocolo que define los métodos y atributos para el view de Home
/// PRESENTER -> VIEW
protocol HomeViewProtocol: GeneralView {
    func showData(data: WeatherResponse)
}
/// Protocolo que define los métodos y atributos para el routing de Home
/// PRESENTER -> ROUTING
protocol HomeRouterProtocol {
}
/// Protocolo que define los métodos y atributos para el Presenter de Home
/// VIEW -> PRESENTER
protocol HomePresenterProtocol {
    func getWeather(latitude: Double, longitude: Double)
}
/// Protocolo que define los métodos y atributos para el Interactor de Home
/// PRESENTER -> INTERACTOR
protocol HomeInteractorInputProtocol {
    func requestWeather(latitude: Double, longitude: Double)
}
/// Protocolo que define los métodos y atributos para el Interactor de Home
/// INTERACTOR -> PRESENTER
protocol HomeInteractorOutputProtocol {
    func sendData(data: WeatherResponse)
    func sendErrorMessage(message: String)
}
