//
//  MainPresenter.swift
//  Counter2.0
//
//  Created by Влад Шимченко on 5.05.26.
//

import Foundation


protocol MainPresenter: AnyObject {
    func reloadingData(_ coins: Coins)
}

final class MainPresenterImpl: MainPresenter {

    private var view: MainViewController

    private var coins: Coins = []

    init(view: MainViewController) {
        self.view = view
    }

    func reloadingData(_ coins: Coins) {
        let sortedCoins = coins.sorted {
            ($0.priceChange24h ?? 0) > ($1.priceChange24h ?? 0)
        }
        self.view.updateView(sortedCoins)
    }
}
