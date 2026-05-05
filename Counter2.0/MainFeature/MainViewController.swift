//
//  MainViewController.swift
//  Counter2.0
//
//  Created by Влад Шимченко on 4.05.26.
//

import UIKit

class MainViewController: BaseController {

    private let tableView = UITableView()

    var interactor: MainInteractor?
    var router: MainRouter?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Crypto"
        view.backgroundColor = .white

        setupTable()

        interactor?.getCoinsData()
        startLoading()
    }

    func updateView() {
        stopLoading()
        tableView.reloadData()
    }

    private func setupTable() {
        view.addSubview(tableView)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CoinCell.self, forCellReuseIdentifier: CoinCell.id)

        tableView.dataSource = self
        tableView.rowHeight = 60

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension MainViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        interactor?.coins.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CoinCell.id,
            for: indexPath
        ) as? CoinCell,
              let coins = interactor?.coins
        else {
            return UITableViewCell()
        }

        cell.configure(with: coins[indexPath.row])
        return cell
    }
}
