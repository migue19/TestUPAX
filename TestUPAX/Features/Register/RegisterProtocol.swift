//
//  RegisterProtocol.swift
//  TestUPAX
//
//  Created by Miguel Mexicano Herrera on 23/12/22.
//  
//

/// Protocolo que define los métodos y atributos para el view de Register
/// PRESENTER -> VIEW
protocol RegisterViewProtocol {
}
/// Protocolo que define los métodos y atributos para el routing de Register
/// PRESENTER -> ROUTING
protocol RegisterRouterProtocol {
    func showHome()
}
/// Protocolo que define los métodos y atributos para el Presenter de Register
/// VIEW -> PRESENTER
protocol RegisterPresenterProtocol {
    func tapContinueAction(data: UserData)
}
/// Protocolo que define los métodos y atributos para el Interactor de Register
/// PRESENTER -> INTERACTOR
protocol RegisterInteractorInputProtocol {
    func saveInfo(data: UserData)
}
/// Protocolo que define los métodos y atributos para el Interactor de Register
/// INTERACTOR -> PRESENTER
protocol RegisterInteractorOutputProtocol {
    func goToHome()
}
