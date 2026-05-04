//
//  ServicesAssembly.swift
//  Counter2.0
//
//  Created by Влад Шимченко on 4.05.26.
//

import Foundation
import Swinject

class ServicesAssembly: Assembly {
    func assemble(container: Container) {
        container.register(LocalStorageService.self, name: "always_not_logged") { _ in
            AlwaysNotLoggedService()
        }

        container.register(LocalStorageService.self, name: "always_logged") { _ in
            AlwaysLoggedInService()
        }
    }
}
