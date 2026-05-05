//
//  MainPresenter.swift
//  Counter2.0
//
//  Created by Влад Шимченко on 5.05.26.
//

import Foundation


protocol MainPresenter: AnyObject {
    func reloadingData()
}

final class MainPresenterImpl: MainPresenter {

    private var view: MainViewController

    init(view: MainViewController) {
        self.view = view
    }

    func reloadingData() {
        self.view.updateView()
    }
}
