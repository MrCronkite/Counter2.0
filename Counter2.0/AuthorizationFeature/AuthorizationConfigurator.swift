//
//  AuthorizationConfigurator.swift
//  Counter2.0
//
//  Created by Влад Шимченко on 4.05.26.
//

import Foundation
import Swinject

final class AuthorizationConfigurator {
    private let resolver: Resolver

    init(resolver: Resolver) {
        self.resolver = resolver
    }
    
    func configure(view: LoginViewController) throws {
        guard let presenter = resolver.resolve(LoginPresenter.self, argument: view),
              let interactor = resolver.resolve(LoginInteractor.self, argument: presenter),
              let router = resolver.resolve(AuthRouter.self)
        else { throw DIErrors.unableToResolve }

        view.interactor = interactor
        view.router = router
    }

    func configure(view: RegisterViewController) throws {
        guard // let interactor = resolver.resolve(RegisterInteractor.self, argument: presenter),
              let router = resolver.resolve(AuthRouter.self)
        else { throw DIErrors.unableToResolve }

        //view.interactor = interactor
        view.router = router
    }
}
