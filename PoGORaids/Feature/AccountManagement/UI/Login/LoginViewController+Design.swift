//
//  LoginViewController+Design.swift
//  PoGORaids
//
//  Created by Borna Relic on 1/30/21.
//

import Foundation
import UIKit
import PureLayout

extension LoginViewController: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutforViews()
    }

    func createViews() {
        containerView = UIStackView()
        view.addSubview(containerView)

        emailLabel = UILabel()
        containerView.addArrangedSubview(emailLabel)

        emailTextField = UITextField()
        containerView.addArrangedSubview(emailTextField)

        passwordLabel = UILabel()
        containerView.addArrangedSubview(passwordLabel)

        passwordTextField = UITextField()
        containerView.addArrangedSubview(passwordTextField)

        loginButton = UIButton()
        containerView.addArrangedSubview(loginButton)

        registerButton = UIButton()
        containerView.addArrangedSubview(registerButton)
    }

    func styleViews() {
        view.backgroundColor = .white

        emailLabel.font = UIFont(name: "Courier", size: 20)
        emailLabel.text = "Email:"
        emailLabel.textAlignment = .left
        emailLabel.textColor = .black

        passwordLabel.font = UIFont(name: "Courier", size: 20)
        passwordLabel.text = "Password:"
        passwordLabel.textAlignment = .left
        passwordLabel.textColor = .black

        emailTextField.font = UIFont(name: "Courier", size: 20)
        emailTextField.textColor = .black
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.borderColor = UIColor.black.cgColor
        
        passwordTextField.font = UIFont(name: "Courier", size: 20)
        passwordTextField.textColor = .black
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = UIColor.black.cgColor

        loginButton.titleLabel?.font = UIFont(name: "Courier", size: 20)
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = .systemBlue
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = 8
        loginButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)

        registerButton.titleLabel?.font = UIFont(name: "Courier", size: 20)
        registerButton.setTitle("Register", for: .normal)
        registerButton.backgroundColor = .white
        registerButton.setTitleColor(.black, for: .normal)
        registerButton.layer.borderWidth = 1
        registerButton.layer.borderColor = UIColor.black.cgColor
        registerButton.layer.cornerRadius = 8
        registerButton.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)

        containerView.axis = .vertical
        containerView.spacing = 20
        containerView.alignment = .fill
    }

    func defineLayoutforViews() {
        containerView.autoCenterInSuperview()
        containerView.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
        containerView.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20)

        registerButton.autoSetDimension(.height, toSize: 50)
        loginButton.autoSetDimension(.height, toSize: 50)

        emailTextField.autoSetDimension(.height, toSize: 40)
        passwordTextField.autoSetDimension(.height, toSize: 40)
    }

}
