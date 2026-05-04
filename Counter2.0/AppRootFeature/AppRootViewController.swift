//
//  AppRootViewController.swift
//  Counter2.0
//
//  Created by Влад Шимченко on 4.05.26.
//

import UIKit

final class AppRootViewController: BaseController {

    var interactor: AppRootInteractor?
    var router: AppRootRouter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .green
        interactor?.checkLoginStatus()
    }

    func isUserLogged(isLogged: Bool) {
        guard let navigationController else {
            showError("NavigationController отсутствует")
            return
        }

        do {
            if isLogged {
                try router?.navigateToAuthoried(parent: navigationController)
            } else {
                try router?.navigateToLogin(parent: navigationController)
            }
        } catch {
            showError(error.localizedDescription)
        }
    }
}
