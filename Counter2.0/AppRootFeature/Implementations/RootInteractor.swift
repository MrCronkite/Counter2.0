//
//  RootInteractor.swift
//  Counter2.0
//
//  Created by Влад Шимченко on 4.05.26.
//

import Foundation

class RootInteractor: AppRootInteractor {

    private let presenter: AppRootPresenter
    private let localService: LocalStorageService

    init(presenter: AppRootPresenter, localService: LocalStorageService) {
        self.localService = localService
        self.presenter = presenter
    }

    func checkLoginStatus() {
        presenter.isUserLogged(isLogged: localService.getLoggedToken() != nil)
    }
}

