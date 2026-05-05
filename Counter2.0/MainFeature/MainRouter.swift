//
//  MainRouter.swift
//  Counter2.0
//
//  Created by Влад Шимченко on 5.05.26.
//

import UIKit
import Swinject

protocol MainRouter: AnyObject {

}

final class MainRouterImpl: MainRouter {
    private let resolver: Resolver

    init(resolver: Resolver) {
        self.resolver = resolver
    }
}

