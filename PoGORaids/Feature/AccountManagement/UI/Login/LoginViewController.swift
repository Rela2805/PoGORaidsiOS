import UIKit
import Alamofire

class LoginViewController: UIViewController {

    var containerView: UIStackView!
    var emailLabel: UILabel!
    var emailTextField: UITextField!
    var passwordLabel: UILabel!
    var passwordTextField: UITextField!
    var loginButton: UIButton!
    var registerButton: UIButton!

    private var presenter: LoginPresenter!

    convenience init(presenter: LoginPresenter) {
        self.init()

        self.presenter = presenter
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        buildViews()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.navigationBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        navigationController?.navigationBar.isHidden = false
    }

    @objc func handleLogin() {
        guard let email = emailTextField.text, !email.isEmpty, let password = passwordTextField.text, !password.isEmpty else { return }

        presenter.handleLogin(email: email, password: password)
    }

    @objc func handleRegister() {
        presenter.handleRegister()
    }

}
