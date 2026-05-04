//
//  AuthAssembly.swift
//  Counter2.0
//
//  Created by Влад Шимченко on 4.05.26.
//

import Foundation
import Swinject

class AuthAssembly: Assembly {
    func assemble(container: Container) {
        container.register(LoginPresenter.self) { _ , controller in
            LoginPresenterImpl(view: controller)
        }

        container.register(LoginInteractor.self) { resolver, presenter in
            LoginInteractorImpl(
                presenter: presenter,
                localStorage: resolver.resolve(LocalStorageService.self, name: "always_not_logged")!
            )
        }

        container.register(AuthRouter.self) { resolver in
            AuthRouterImpl(resolver: resolver)
        }

        container.register(AuthorizationConfigurator.self) { resolver  in
            AuthorizationConfigurator(resolver: resolver)
        }
    }
}
