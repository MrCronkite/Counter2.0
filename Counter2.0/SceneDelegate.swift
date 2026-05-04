//
//  SceneDelegate.swift
//  Counter2.0
//
//  Created by Влад Шимченко on 4.05.26.
//

import UIKit
import Swinject

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    private static let assembler = Assembler([
        ServicesAssembly(),
        RootAssembly()
    ])

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = scene as? UIWindowScene else { return }

        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = makeRootController()
        window.makeKeyAndVisible()

        self.window = window
    }
}

// MARK: - MakeRootController

private extension SceneDelegate {

    func makeRootController() -> UIViewController {
        guard let configurator = Self.assembler.resolver.resolve(AppRootConfigurator.self) else {
            return CrashErrorController()
        }

        let controller = AppRootViewController()

        do {
            try configurator.configure(view: controller)
            return UINavigationController(rootViewController: controller)
        } catch {
            return CrashErrorController()
        }
    }
}

