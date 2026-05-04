//
//  AppRootRouter.swift
//  Counter2.0
//
//  Created by Влад Шимченко on 4.05.26.
//

import UIKit

protocol AppRootRouter: AnyObject {
    func navigateToLogin(parent: UINavigationController)
    func navigateToAuthoried(parent: UINavigationController)
}
