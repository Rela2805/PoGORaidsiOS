//
//  RegisterViewController+Design.swift
//  PoGORaids
//
//  Created by Borna Relic on 1/31/21.
//

import UIKit

extension RegisterViewController: ConstructViewsProtocol {

    func buildVies() {
        createViews()
        styleViews()
        defineLayoutforViews()
    }

    func createViews() {
        scrollView = UIScrollView()
        view.addSubview(scrollView)

        containerView = UIStackView()
        scrollView.addSubview(containerView)

        fullNameLabel = UILabel()
        containerView.addArrangedSubview(fullNameLabel)

        fullNameTextField = UITextField()
        containerView.addArrangedSubview(fullNameTextField)

        emailLabel = UILabel()
        containerView.addArrangedSubview(emailLabel)

        emailTextField = UITextField()
        containerView.addArrangedSubview(emailTextField)

        usernameLabel = UILabel()
        containerView.addArrangedSubview(usernameLabel)

        usernameTextField = UITextField()
        containerView.addArrangedSubview(usernameTextField)

        passwordLabel = UILabel()
        containerView.addArrangedSubview(passwordLabel)

        passwordTextField = UITextField()
        containerView.addArrangedSubview(passwordTextField)

        confirmPasswordLabel = UILabel()
        containerView.addArrangedSubview(confirmPasswordLabel)

        confirmPasswordTextField = UITextField()
        containerView.addArrangedSubview(confirmPasswordTextField)

        gameNickLabel = UILabel()
        containerView.addArrangedSubview(gameNickLabel)

        gameNickTextField = UITextField()
        containerView.addArrangedSubview(gameNickTextField)

        gameCodeLabel = UILabel()
        containerView.addArrangedSubview(gameCodeLabel)

        gameCodeTextField = UITextField()
        containerView.addArrangedSubview(gameCodeTextField)

        levelLabel = UILabel()
        containerView.addArrangedSubview(levelLabel)

        levelTextField = UITextField()
        containerView.addArrangedSubview(levelTextField)

        teamPicker = UIPickerView()
        containerView.addArrangedSubview(teamPicker)

        registerButton = UIButton()
        containerView.addArrangedSubview(registerButton)
    }

    func styleViews() {
        view.backgroundColor = .white

        styleLabel(label: fullNameLabel, text: "Full name:")
        styleLabel(label: emailLabel, text: "Email: ")
        styleLabel(label: usernameLabel, text: "Username: ")
        styleLabel(label: passwordLabel, text: "Password:")
        styleLabel(label: confirmPasswordLabel, text: "Confirm password:")
        styleLabel(label: gameNickLabel, text: "Game nickname:")
        styleLabel(label: gameCodeLabel, text: "Game code:")
        styleLabel(label: levelLabel, text: "In game level:")

        styleTextField(textField: fullNameTextField)
        styleTextField(textField: emailTextField)
        styleTextField(textField: usernameTextField)
        styleTextField(textField: passwordTextField)
        styleTextField(textField: confirmPasswordTextField)
        styleTextField(textField: gameNickTextField)
        styleTextField(textField: gameCodeTextField)
        styleTextField(textField: levelTextField)

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

        teamPicker.delegate = self
        teamPicker.dataSource = self
    }

    func defineLayoutforViews() {
        scrollView.autoPinEdgesToSuperviewMargins()

        containerView.autoSetDimension(.width, toSize: view.frame.width - 40)
        containerView.autoPinEdge(toSuperviewMargin: .top, withInset: 20)
        containerView.autoPinEdge(toSuperviewMargin: .bottom)
        containerView.autoPinEdge(toSuperviewEdge: .leading)
        containerView.autoPinEdge(toSuperviewEdge: .trailing)

        registerButton.autoSetDimension(.height, toSize: 50)

        fullNameTextField.autoSetDimension(.height, toSize: 40)
        emailTextField.autoSetDimension(.height, toSize: 40)
        usernameTextField.autoSetDimension(.height, toSize: 40)
        passwordTextField.autoSetDimension(.height, toSize: 40)
        confirmPasswordTextField.autoSetDimension(.height, toSize: 40)
        gameNickTextField.autoSetDimension(.height, toSize: 40)
        gameCodeTextField.autoSetDimension(.height, toSize: 40)
        levelTextField.autoSetDimension(.height, toSize: 40)
        teamPicker.autoSetDimension(.height, toSize: 200)
    }

    private func styleLabel(label: UILabel, text: String) {
        label.font = UIFont(name: "Courier", size: 20)
        label.text = text
        label.textAlignment = .left
        label.textColor = .black
    }

    private func styleTextField(textField: UITextField) {
        textField.font = UIFont(name: "Courier", size: 20)
        textField.textColor = .black
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
    }

}
