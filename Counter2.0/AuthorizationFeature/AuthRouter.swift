//
//  AuthRouter.swift
//  Counter2.0
//
//  Created by Влад Шимченко on 4.05.26.
//

import UIKit
import Swinject

protocol AuthRouter: AnyObject {
    func goToRegister(parent: UINavigationController) throws
    func backToLogin(view: BaseController)
}

final class AuthRouterImpl: AuthRouter {
    private let resolver: Resolver

    init(resolver: Resolver) {
        self.resolver = resolver
    }

    func goToRegister(parent: UINavigationController) throws {
        guard let authConfigurator = resolver.resolve(AuthorizationConfigurator.self)
        else { throw DIErrors.unableToResolve }

        let controller = RegisterViewController()
        try authConfigurator.configure(view: controller)

        parent.pushViewController(controller, animated: true)
    }

    func backToLogin(view: BaseController) {
        guard let nav = view.navigationController else { return }
        nav.popViewController(animated: true)
    }
}
