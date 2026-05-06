//
//  MainInteractor.swift
//  Counter2.0
//
//  Created by Влад Шимченко on 5.05.26.
//

import Foundation

protocol MainInteractor: AnyObject {
    func getCoinsData()
}

final class MainInteractorImpl: MainInteractor {

    private let presenter: MainPresenter
    private let networkServie: NetworkServices

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
                presenter.reloadingData(coins)
            } catch {
                print("error")
            }
        }
    }
}




