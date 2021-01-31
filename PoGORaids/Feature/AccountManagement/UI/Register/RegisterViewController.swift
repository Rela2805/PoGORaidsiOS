//
//  RegisterViewController.swift
//  PoGORaids
//
//  Created by Borna Relic on 1/31/21.
//

import UIKit

class RegisterViewController: UIViewController {

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
    var confirmPasswordLabel: UILabel!
    var confirmPasswordTextField: UITextField!
    var gameNickLabel: UILabel!
    var gameNickTextField: UITextField!
    var gameCodeLabel: UILabel!
    var gameCodeTextField: UITextField!
    var levelLabel: UILabel!
    var levelTextField: UITextField!
    var teamPicker: UIPickerView!
    var registerButton: UIButton!

    private var presenter: RegisterPresenter!
    private var teams: [TeamModel] = []

    convenience init(presenter: RegisterPresenter) {
        self.init()

        self.presenter = presenter
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        buildVies()

        presenter.getTeams { [weak self] teams in
            self?.teams = teams

            DispatchQueue.main.async { [weak self] in
                self?.teamPicker.reloadAllComponents()
            }
        }
    }

    @objc func handleRegister() {
        guard
            let fullname = fullNameTextField.text, !fullname.isEmpty,
            let email = emailTextField.text, !email.isEmpty,
            let username = usernameTextField.text, !username.isEmpty,
            let password = passwordTextField.text, !password.isEmpty,
            let confirmPassword = confirmPasswordTextField.text, !confirmPassword.isEmpty,
            let gameNick = gameNickTextField.text, !gameNick.isEmpty,
            let gameCode = gameCodeTextField.text, !gameCode.isEmpty,
            let level = levelTextField.text, !level.isEmpty,
            password == confirmPassword
        else { return }

        let team = teams[teamPicker.selectedRow(inComponent: 0)]

        presenter.handleRegister(fullname: fullname, email: email, username: username, password: password, gameNick: gameNick, gameCode: gameCode, level: level, team: team.color.rawValue)
    }

}

extension RegisterViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return teams.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        teams[row].color.rawValue
    }
}
