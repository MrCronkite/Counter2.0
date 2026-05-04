//
//  LoginInteractor.swift
//  Counter2.0
//
//  Created by Влад Шимченко on 4.05.26.
//

import UIKit

protocol LoginInteractor: AnyObject {
    
}

class LoginInteractorImpl: LoginInteractor {

    private let presenter: LoginPresenter
    private let localStorage: LocalStorageService

    init(presenter: LoginPresenter, localStorage: LocalStorageService) {
        self.presenter = presenter
        self.localStorage = localStorage
    }
}
