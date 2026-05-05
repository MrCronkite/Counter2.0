//
//  MainAssembly.swift
//  Counter2.0
//
//  Created by Влад Шимченко on 5.05.26.
//

import Foundation
import Swinject

class MainAssembly: Assembly {
    func assemble(container: Container) {
        container.register(MainPresenter.self) { _ , controller in
            MainPresenterImpl(view: controller)
        }

        container.register(MainInteractor.self) { resolver, presenter in
            MainInteractorImpl(
                presenter: presenter,
                networkServie: resolver.resolve(NetworkServices.self)!
            )
        }

        container.register(MainRouter.self) { resolver in
            MainRouterImpl(resolver: resolver)
        }

        container.register(MainConfigurator.self) { resolver  in
            MainConfigurator(resolver: resolver)
        }
    }
}

