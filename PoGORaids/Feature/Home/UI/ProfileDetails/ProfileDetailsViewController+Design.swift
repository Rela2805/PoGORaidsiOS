//
//  ProfileDetailsViewController+Design.swift
//  PoGORaids
//
//  Created by Borna Relic on 1/31/21.
//

import UIKit

extension ProfileDetailsViewController: ConstructViewsProtocol {

    func buildViews() {
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

        gameNickLabel = UILabel()
        containerView.addArrangedSubview(gameNickLabel)

        gameNickTextField = UITextField()
        containerView.addArrangedSubview(gameNickTextField)

        levelLabel = UILabel()
        containerView.addArrangedSubview(levelLabel)

        levelTextField = UITextField()
        containerView.addArrangedSubview(levelTextField)

        saveChangesButton = UIButton()
        containerView.addArrangedSubview(saveChangesButton)

        logoutButton = UIButton()
        containerView.addArrangedSubview(logoutButton)

        deleteButton = UIButton()
        containerView.addArrangedSubview(deleteButton)
    }

    func styleViews() {
        view.backgroundColor = .white

        styleLabel(label: fullNameLabel, text: "Full name:")
        styleLabel(label: emailLabel, text: "Email: ")
        styleLabel(label: usernameLabel, text: "Username: ")
        styleLabel(label: passwordLabel, text: "Password:")
        styleLabel(label: gameNickLabel, text: "Game nickname:")
        styleLabel(label: levelLabel, text: "In game level:")

        styleTextField(textField: fullNameTextField)
        styleTextField(textField: emailTextField)
        styleTextField(textField: usernameTextField)
        styleTextField(textField: passwordTextField)
        styleTextField(textField: gameNickTextField)
        styleTextField(textField: levelTextField)

        saveChangesButton.titleLabel?.font = UIFont(name: "Courier", size: 20)
        saveChangesButton.setTitle("Save changes", for: .normal)
        saveChangesButton.backgroundColor = .systemBlue
        saveChangesButton.setTitleColor(.black, for: .normal)
        saveChangesButton.layer.cornerRadius = 8
        saveChangesButton.addTarget(self, action: #selector(handlseSaveChanges), for: .touchUpInside)

        logoutButton.titleLabel?.font = UIFont(name: "Courier", size: 20)
        logoutButton.setTitle("Log out", for: .normal)
        logoutButton.backgroundColor = .white
        logoutButton.setTitleColor(.black, for: .normal)
        logoutButton.layer.borderWidth = 1
        logoutButton.layer.borderColor = UIColor.black.cgColor
        logoutButton.layer.cornerRadius = 8
        logoutButton.addTarget(self, action: #selector(handleLogout), for: .touchUpInside)

        deleteButton.titleLabel?.font = UIFont(name: "Courier", size: 20)
        deleteButton.setTitle("Delete account", for: .normal)
        deleteButton.backgroundColor = .systemRed
        deleteButton.setTitleColor(.black, for: .normal)
        deleteButton.layer.cornerRadius = 8
        deleteButton.addTarget(self, action: #selector(handleDelete), for: .touchUpInside)

        containerView.axis = .vertical
        containerView.spacing = 20
        containerView.alignment = .fill
    }

    func defineLayoutforViews() {
        scrollView.autoPinEdgesToSuperviewMargins()

        containerView.autoSetDimension(.width, toSize: view.frame.width - 40)
        containerView.autoPinEdge(toSuperviewMargin: .top, withInset: 20)
        containerView.autoPinEdge(toSuperviewMargin: .bottom)
        containerView.autoPinEdge(toSuperviewEdge: .leading)
        containerView.autoPinEdge(toSuperviewEdge: .trailing)

        saveChangesButton.autoSetDimension(.height, toSize: 50)
        logoutButton.autoSetDimension(.height, toSize: 50)
        deleteButton.autoSetDimension(.height, toSize: 50)

        fullNameTextField.autoSetDimension(.height, toSize: 40)
        emailTextField.autoSetDimension(.height, toSize: 40)
        usernameTextField.autoSetDimension(.height, toSize: 40)
        passwordTextField.autoSetDimension(.height, toSize: 40)
        gameNickTextField.autoSetDimension(.height, toSize: 40)
        levelTextField.autoSetDimension(.height, toSize: 40)
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

