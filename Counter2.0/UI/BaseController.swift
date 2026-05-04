//
//  BaseController.swift
//  Counter2.0
//
//  Created by Влад Шимченко on 4.05.26.
//

import UIKit

class BaseController: UIViewController {

    private var activityIndicator: UIActivityIndicatorView?
    private var overlayView: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = true
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }

    // MARK: - Activity Indicator

    func startLoading() {
        guard activityIndicator == nil else { return }

        let overlay = UIView()
        overlay.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        overlay.translatesAutoresizingMaskIntoConstraints = false

        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = .white
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.startAnimating()

        view.addSubview(overlay)
        overlay.addSubview(indicator)

        NSLayoutConstraint.activate([
            overlay.topAnchor.constraint(equalTo: view.topAnchor),
            overlay.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            overlay.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            overlay.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            indicator.centerXAnchor.constraint(equalTo: overlay.centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: overlay.centerYAnchor)
        ])

        self.overlayView = overlay
        self.activityIndicator = indicator
    }

    func stopLoading() {
        activityIndicator?.stopAnimating()
        overlayView?.removeFromSuperview()
        activityIndicator = nil
        overlayView = nil
    }

    // MARK: - Alert

    func showError(_ message: String) {
        let alert = UIAlertController(
            title: "Error",
            message: message,
            preferredStyle: .alert
        )

        alert.addAction(UIAlertAction(title: "OK", style: .default))

        present(alert, animated: true)
    }
}
