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
    func tapContinueAction() {
        interactor?.saveInfo()
    }
}
extension RegisterPresenter: RegisterInteractorOutputProtocol {
}
