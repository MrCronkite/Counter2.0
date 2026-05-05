//
//  MainConfigurator.swift
//  Counter2.0
//
//  Created by Влад Шимченко on 5.05.26.
//

import Foundation
import Swinject

struct MainConfigurator {

    private let resolver: Resolver

    init(resolver: Resolver) {
        self.resolver = resolver
    }

    func configure(view: MainViewController) throws {
        guard let presenter = resolver.resolve(MainPresenter.self, argument: view),
              let interactor = resolver.resolve(MainInteractor.self, argument: presenter),
              let router = resolver.resolve(MainRouter.self)
        else { throw DIErrors.unableToResolve }

        view.interactor = interactor
        view.router = router

    }

}
