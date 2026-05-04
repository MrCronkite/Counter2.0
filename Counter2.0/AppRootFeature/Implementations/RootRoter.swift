//
//  RootRoter.swift
//  Counter2.0
//
//  Created by Влад Шимченко on 4.05.26.
//

import UIKit
import Swinject

class RootRoter: AppRootRouter {

    private let resolver: Resolver

    init(resolver: Resolver) {
        self.resolver = resolver
    }

    func navigateToLogin(parent: UINavigationController) {
        parent.pushViewController(LoginViewController(), animated: true)
    }

    func navigateToAuthoried(parent: UINavigationController) {
        parent.pushViewController(MainViewController(), animated: true)
    }
}
