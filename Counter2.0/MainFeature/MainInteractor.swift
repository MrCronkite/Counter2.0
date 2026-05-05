//
//  MainInteractor.swift
//  Counter2.0
//
//  Created by Влад Шимченко on 5.05.26.
//

import Foundation

protocol MainInteractor: AnyObject {
    var coins: [Coin] { get set }
    
    func getCoinsData()
}

final class MainInteractorImpl: MainInteractor {

    private let presenter: MainPresenter
    private let networkServie: NetworkServices

    var coins: [Coin] = []

    init(
        presenter: MainPresenter,
        networkServie: NetworkServices
    ) {
        self.presenter = presenter
        self.networkServie = networkServie
    }


    func getCoinsData() {
        Task {
            do {
                let coins = try await networkServie.getCoinsData()
                self.coins = coins
                presenter.reloadingData()
            } catch {
                print("error")
            }
        }
    }
}




