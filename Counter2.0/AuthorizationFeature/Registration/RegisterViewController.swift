//
//  RegisterViewController.swift
//  Counter2.0
//
//  Created by Влад Шимченко on 4.05.26.
//

import UIKit

final class RegisterViewController: BaseController {

    private let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .darkGray
        return label
    }()

    private let loginTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter login"
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.backgroundColor = UIColor(white: 0.95, alpha: 1)
        return tf
    }()

    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .darkGray
        return label
    }()

    private let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter password"
        tf.borderStyle = .roundedRect
        tf.isSecureTextEntry = true
        tf.backgroundColor = UIColor(white: 0.95, alpha: 1)
        return tf
    }()

    private let registerButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Register", for: .normal)
        btn.backgroundColor = .systemBlue
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 10
        btn.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        return btn
    }()

    private let backButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Back", for: .normal)
        btn.backgroundColor = .clear
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        return btn
    }()

    var router: AuthRouter?
    //var interactor: RegisterInteractor?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupActions()
    }

}

extension RegisterViewController {

    private func setupUI() {
        view.backgroundColor = .white

        [
            loginLabel,
            loginTextField,
            passwordLabel,
            passwordTextField,
            backButton,
            registerButton
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }

        NSLayoutConstraint.activate([

            // Login Label
            loginLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            loginLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),

            // Login TextField
            loginTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 8),
            loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            loginTextField.heightAnchor.constraint(equalToConstant: 44),

            // Password Label
            passwordLabel.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 20),
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),

            // Password TextField
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 8),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            passwordTextField.heightAnchor.constraint(equalToConstant: 44),

            // Register Button
            registerButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            registerButton.heightAnchor.constraint(equalToConstant: 50),

            // Back Button
            backButton.bottomAnchor.constraint(equalTo: registerButton.topAnchor, constant: -10),
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    private func setupActions() {
        registerButton.addTarget(self, action: #selector(didTapRegister), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)
    }

    @objc private func didTapRegister() {
        print("Register")
    }

    @objc private func didTapBack() {
        router?.backToLogin(view: self)
    }
}
