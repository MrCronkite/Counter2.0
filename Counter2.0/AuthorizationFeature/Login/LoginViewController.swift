//
//  LoginViewController.swift
//  Counter2.0
//
//  Created by Влад Шимченко on 4.05.26.
//

import UIKit
import SnapKit

final class LoginViewController: BaseController {

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

    private let loginButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Log In", for: .normal)
        btn.backgroundColor = .systemBlue
        btn.setTitleColor(.white, for: .normal)
        btn.setTitleColor(.white.withAlphaComponent(0.5), for: .disabled)
        btn.layer.cornerRadius = 10
        btn.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        return btn
    }()

    private let registerButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Register", for: .normal)
        btn.backgroundColor = .systemBlue
        btn.setTitleColor(.white, for: .normal)
        btn.setTitleColor(.white.withAlphaComponent(0.5), for: .disabled)
        btn.layer.cornerRadius = 10
        btn.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        return btn
    }()

    var interactor: LoginInteractor?
    var router: AuthRouter?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupActions()
    }

    func setloginEnabled(_ isEnabled: Bool) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            self.loginButton.isEnabled = isEnabled
            self.registerButton.isEnabled = isEnabled
        }
    }
}

extension LoginViewController {
    private func setupUI() {
        view.backgroundColor = .white
        
        [
            loginLabel,
            loginTextField,
            passwordLabel,
            passwordTextField,
            loginButton,
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

            // Login Button
            loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            loginButton.heightAnchor.constraint(equalToConstant: 50),

            // Register Button
            registerButton.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -10),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            registerButton.heightAnchor.constraint(equalToConstant: 50),
        ])

        loginButton.isEnabled = false
        registerButton.isEnabled = false
    }

    private func setupActions() {
        registerButton.addTarget(self, action: #selector(didTapRegister), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)

        loginTextField.addTarget(self, action: #selector(loginDidchange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(passwordDidchange), for: .editingChanged)
    }

    @objc
    private func didTapRegister() {
        guard let navParent = navigationController else { return }

        do {
          try router?.goToRegister(parent: navParent)
        } catch {
          showError("DIError")
        }
    }

    @objc
    private func didTapLogin() {
        guard let navParent = navigationController else { return }

        do {
          try router?.goToMain(parent: navParent)
        } catch {
          showError("DIError")
        }
    }

    @objc
    private func loginDidchange(_ textField: UITextField) {
        interactor?.updateLogin(textField.text ?? "")
    }

    @objc
    private func passwordDidchange(_ textField: UITextField) {
        interactor?.updatePassword(textField.text ?? "")
    }
}

