//
//  ProfileDetailsViewController.swift
//  PoGORaids
//
//  Created by Borna Relic on 1/31/21.
//

import UIKit

class ProfileDetailsViewController: UIViewController {

    var scrollView: UIScrollView!
    var containerView: UIStackView!
    var fullNameLabel: UILabel!
    var fullNameTextField: UITextField!
    var emailLabel: UILabel!
    var emailTextField: UITextField!
    var usernameLabel: UILabel!
    var usernameTextField: UITextField!
    var passwordLabel: UILabel!
    var passwordTextField: UITextField!
    var gameNickLabel: UILabel!
    var gameNickTextField: UITextField!
    var levelLabel: UILabel!
    var levelTextField: UITextField!
    var saveChangesButton: UIButton!
    var deleteButton: UIButton!
    var logoutButton: UIButton!

    private var presenter: ProfileDetailsPresenter!

    convenience init(presenter: ProfileDetailsPresenter) {
        self.init()

        self.presenter = presenter
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        buildViews()
        bindPresenter()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.navigationBar.isHidden = true
    }

    @objc func handlseSaveChanges() {
        guard
            let fullname = fullNameTextField.text, !fullname.isEmpty,
            let email = emailTextField.text, !email.isEmpty,
            let username = usernameTextField.text, !username.isEmpty,
            let password = passwordTextField.text, !password.isEmpty,
            let gameNick = gameNickTextField.text, !gameNick.isEmpty,
            let level = levelTextField.text, !level.isEmpty
        else { return }

        presenter.handleSaveChanges(fullname: fullname, email: email, username: username, password: password, gameNick: gameNick, level: level)
    }

    @objc func handleDelete() {
        presenter.handleDeleteAccount()
    }

    @objc func handleLogout() {
        presenter.handleLogout()
    }

    private func bindPresenter() {
        presenter.getUserData() { [weak self] user in
            guard let user = user else { return }

            DispatchQueue.main.async { [weak self] in
                self?.fullNameTextField.text = "\(user.name) \(user.surname)"
                self?.emailTextField.text = user.email
                self?.usernameTextField.text = user.username
                self?.gameNickTextField.text = user.gameNickname
                self?.levelTextField.text = "\(user.level)"
            }
        }
    }

}
