//
//  RegisterPresenter.swift
//  TestUPAX
//
//  Created by Miguel Mexicano Herrera on 23/12/22.
//  
//

import Foundation

class RegisterPresenter {
    var view: RegisterViewProtocol?
    var interactor: RegisterInteractorInputProtocol?
    var router: RegisterRouterProtocol?
}
extension RegisterPresenter: RegisterPresenterProtocol {
    func tapContinueAction(data: UserData) {
        interactor?.saveInfo(data: data)
    }
}
extension RegisterPresenter: RegisterInteractorOutputProtocol {
    func goToHome() {
        router?.showHome()
    }
}
