//
//  AppRootConfigurator.swift
//  Counter2.0
//
//  Created by Влад Шимченко on 4.05.26.
//

import Foundation
import Swinject

struct AppRootConfigurator {

    private let resolver: Resolver

    init(resolver: Resolver) {
        self.resolver = resolver
    }

    func configure(view: AppRootViewController) throws {
        guard let presenter = resolver.resolve(AppRootPresenter.self, argument: view),
              let interactor: AppRootInteractor = resolver.resolve(AppRootInteractor.self, argument: presenter),
              let router = resolver.resolve(AppRootRouter.self)
        else { throw DIErrors.unableToResolve }

        view.interactor = interactor
        view.router = router

    }
    
}
