//
//  AppRootViewController.swift
//  Counter2.0
//
//  Created by Влад Шимченко on 4.05.26.
//

import UIKit

final class AppRootViewController: UIViewController {

    var interactor: AppRootInteractor?
    var router: AppRootRouter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .green
        interactor?.checkLoginStatus()
    }

    func isUserLogged(isLogged: Bool) {
        if isLogged {
            router?.navigateToAuthoried(parent: self.navigationController!)
        } else {
            router?.navigateToLogin(parent: self.navigationController!)
        }
    }
}
