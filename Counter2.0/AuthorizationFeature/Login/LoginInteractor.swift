//
//  LoginInteractor.swift
//  Counter2.0
//
//  Created by Влад Шимченко on 4.05.26.
//

import UIKit

protocol LoginInteractor: AnyObject {
    func updateLogin(_ login: String)
    func updatePassword(_ password: String)
}

class LoginInteractorImpl: LoginInteractor {

    private let presenter: LoginPresenter
    private let localStorage: LocalStorageService

    private var login: String = ""
    private var password: String = ""

    init(presenter: LoginPresenter, localStorage: LocalStorageService) {
        self.presenter = presenter
        self.localStorage = localStorage
    }

    func updateLogin(_ login: String) {
        self.login = login
        self.presenter.setLoginEnabled(self.validate())
    }

    func updatePassword(_ password: String) {
        self.password = password
        self.presenter.setLoginEnabled(self.validate())
    }

    private func validate() -> Bool {
        !self.login.isEmpty && !self.password.isEmpty
    }
}
