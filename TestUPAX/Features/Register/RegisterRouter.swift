//
//  RegisterRouter.swift
//  TestUPAX
//
//  Created by Miguel Mexicano Herrera on 23/12/22.
//  
//

class RegisterRouter {
    var view: RegisterVC
    private var presenter: RegisterPresenter
    private var interactor: RegisterInteractor
    init() {
        self.view = RegisterVC()
        self.presenter = RegisterPresenter()
        self.interactor = RegisterInteractor()
        view.presenter = self.presenter
        presenter.view = self.view
        presenter.interactor = self.interactor
        presenter.router = self
        interactor.presenter = self.presenter
    }
}
extension RegisterRouter: RegisterRouterProtocol {
}
