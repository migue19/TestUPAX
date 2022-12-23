//
//  RegisterInteractor.swift
//  TestUPAX
//
//  Created by Miguel Mexicano Herrera on 23/12/22.
//  
//

class RegisterInteractor {
    var presenter: RegisterInteractorOutputProtocol?
}
extension RegisterInteractor: RegisterInteractorInputProtocol {
    func saveInfo(data: UserData) {
        PersistenceManager.deleteInfoUserDefaults(key: PersistenceManagerKey.userData)
        PersistenceManager.saveEntity(data: data, key: PersistenceManagerKey.userData)
        presenter?.goToHome()
    }
}
