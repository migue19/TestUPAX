//
//  HomePresenter.swift
//  TestUPAX
//
//  Created by Miguel Mexicano Herrera on 23/12/22.
//  
//

import Foundation

class HomePresenter {
    var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var router: HomeRouterProtocol?
}
extension HomePresenter: HomePresenterProtocol {
    func getWeather(latitude: Double, longitude: Double) {
        view?.showHUD()
        interactor?.requestWeather(latitude: latitude, longitude: longitude)
    }
    
}
extension HomePresenter: HomeInteractorOutputProtocol {
    func sendData(data: WeatherResponse) {
        view?.hideHUD()
        view?.showData(data: data)
    }
    
    func sendErrorMessage(message: String) {
        view?.hideHUD()
        view?.showMessage(message: message, type: .error)
    }
}
