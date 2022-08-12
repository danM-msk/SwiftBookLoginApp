//  Created by Daniyar Mamadov on 12.08.2022.

import UIKit

final internal class LoginViewController: UIViewController {
    
    //MARK: - Declare UI elements
    
    private let loginDetails = (username: "qwerty", password: "12345678")
    
    internal lazy var verticalStackView: UIStackView = {
        getStackView(axis: .vertical, spacing: 10)
    }()
    
    internal lazy var horizontalStackView: UIStackView = {
        getStackView(axis: .horizontal, spacing: 40)
    }()
    
    internal lazy var usernameTextField: UITextField = {
        getTextField(placeholder: "Username", isPassword: false)
    }()
    
    internal lazy var passwordTextField: UITextField = {
        getTextField(placeholder: "Password", isPassword: true)
    }()
    
    internal lazy var loginButton: UIButton = {
        getButton(title: "Log In", action: #selector(loginButtonTapped))
    }()
    
    internal lazy var forgotUsernameButton: UIButton = {
        getButton(title: "Forgot username?", action: #selector(forgotButtonTapped))
    }()
    
    internal lazy var forgotPasswordButton: UIButton = {
        getButton(title: "Forgot password?", action: #selector(forgotButtonTapped))
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        configureUI()
    }
    
    // MARK: - Private methods
    
    @objc private func loginButtonTapped() {
        if usernameTextField.text == loginDetails.username
            && passwordTextField.text == loginDetails.password {
            let welcomeViewController = WelcomeViewController(username: usernameTextField.text ?? "")
            welcomeViewController.modalTransitionStyle = .flipHorizontal
            welcomeViewController.modalPresentationStyle = .fullScreen
            present(welcomeViewController, animated: true, completion: nil)
        } else {
            showAlert(title: "Invalid login or password",
                      message: "Please, enter correct login and password") {
                self.passwordTextField.text = ""
            }
        }
    }
    
    @objc private func forgotButtonTapped(sender: UIButton) {
        if sender.currentTitle == "Forgot username?" {
            showAlert(title: "Your username is:",
                      message: loginDetails.username,
                      completion: nil)
        } else {
            showAlert(title: "Your password is:",
                      message: loginDetails.password,
                      completion: nil)
        }
    }
    
    private func showAlert(title: String , message: String?, completion: (() -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
        self.present(alert, animated: true, completion: completion)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
    }

}

