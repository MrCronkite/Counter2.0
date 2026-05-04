//
//  RootPresenter.swift
//  Counter2.0
//
//  Created by Влад Шимченко on 4.05.26.
//

import Foundation

class RootPresenter: AppRootPresenter {
    private let view: AppRootViewController

    init(view: AppRootViewController) {
        self.view = view
    }

    func isUserLogged(isLogged: Bool) {
        view.isUserLogged(isLogged: isLogged)
    }
}
