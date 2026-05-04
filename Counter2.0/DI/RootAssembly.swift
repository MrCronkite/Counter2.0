//
//  RootAssembly.swift
//  Counter2.0
//
//  Created by Влад Шимченко on 4.05.26.
//

import Foundation
import Swinject

class RootAssembly: Assembly {

    func assemble(container: Container) {
        container.register(AppRootPresenter.self) { _, controller in
            RootPresenter(
                view: controller
            )
        }

        container.register(AppRootInteractor.self) { resolver, presenter in
            RootInteractor(
                presenter: presenter,
                localService: resolver.resolve(LocalStorageService.self, name: "always_logged")!
            )
        }

        container.register(AppRootRouter.self) { resolver in
            RootRoter(
                resolver: resolver
            )
        }

        container.register(AppRootConfigurator.self) { resolver in
            AppRootConfigurator(
                resolver: resolver
            )
        }
    }
}

