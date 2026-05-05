//
//  CoinsCell.swift
//  Counter2.0
//
//  Created by Влад Шимченко on 5.05.26.
//


import UIKit
import Kingfisher

final class CoinCell: UITableViewCell {

    static let id = "CoinCell"

    // MARK: - UI

    private let container: UIView = {
        let v = UIView()
        v.backgroundColor = .systemBackground
        v.layer.cornerRadius = 14
        v.layer.shadowColor = UIColor.black.cgColor
        v.layer.shadowOpacity = 0.05
        v.layer.shadowRadius = 8
        v.layer.shadowOffset = CGSize(width: 0, height: 2)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    private let coinImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 16
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .label
        return label
    }()

    private let symbolLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.textColor = .secondaryLabel
        return label
    }()

    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textAlignment = .right
        label.textColor = .label
        return label
    }()

    private let changeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .semibold)
        label.textAlignment = .right
        return label
    }()

    // MARK: - init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    // MARK: - UI Setup

    private func setupUI() {
        contentView.addSubview(container)

        let leftStack = UIStackView(arrangedSubviews: [nameLabel, symbolLabel])
        leftStack.axis = .vertical
        leftStack.spacing = 2
        leftStack.translatesAutoresizingMaskIntoConstraints = false

        let rightStack = UIStackView(arrangedSubviews: [priceLabel, changeLabel])
        rightStack.axis = .vertical
        rightStack.spacing = 4
        rightStack.alignment = .trailing
        rightStack.translatesAutoresizingMaskIntoConstraints = false

        container.addSubview(coinImageView)
        container.addSubview(leftStack)
        container.addSubview(rightStack)

        NSLayoutConstraint.activate([
            // container
            container.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6),
            container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),

            // image
            coinImageView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 12),
            coinImageView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            coinImageView.widthAnchor.constraint(equalToConstant: 36),
            coinImageView.heightAnchor.constraint(equalToConstant: 36),

            // left stack
            leftStack.leadingAnchor.constraint(equalTo: coinImageView.trailingAnchor, constant: 12),
            leftStack.centerYAnchor.constraint(equalTo: container.centerYAnchor),

            // right stack
            rightStack.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -12),
            rightStack.centerYAnchor.constraint(equalTo: container.centerYAnchor)
        ])
    }
    func configure(with coin: Coin) {
        nameLabel.text = coin.name
        symbolLabel.text = coin.symbol.uppercased()
        priceLabel.text = "$\(coin.currentPrice)"

        if let change = coin.priceChange24h {
            changeLabel.text = String(format: "%+.2f%%", change)
            changeLabel.textColor = change >= 0 ? .systemGreen : .systemRed
        }

        coinImageView.kf.setImage(with: URL(string: coin.image))
    }
}
