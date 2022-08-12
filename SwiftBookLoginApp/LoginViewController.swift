//  Created by Daniyar Mamadov on 12.08.2022.

import UIKit

final internal class LoginViewController: UIViewController {
    
    private let loginDetails = (username: "qwerty", password: "12345678")
    
    private lazy var verticalStackView: UIStackView = {
        getStackView(axis: .vertical, spacing: 10)
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        getStackView(axis: .horizontal, spacing: 40)
    }()
    
    private lazy var usernameTextField: UITextField = {
        getTextField(placeholder: "Username", isPassword: false)
    }()
    
    private lazy var passwordTextField: UITextField = {
        getTextField(placeholder: "Password", isPassword: true)
    }()
    
    private lazy var loginButton: UIButton = {
        getButton(title: "Log In", action: #selector(loginButtonTapped))
    }()
    
    private lazy var forgotUsernameButton: UIButton = {
        getButton(title: "Forgot username?", action: #selector(forgotButtonTapped))
    }()
    
    private lazy var forgotPasswordButton: UIButton = {
        getButton(title: "Forgot password?", action: #selector(forgotButtonTapped))
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        configureUI()
    }
    
    private func getStackView(axis: NSLayoutConstraint.Axis, spacing: CGFloat) -> UIStackView {
        let view = UIStackView()
        view.axis = axis
        view.distribution = .fillEqually
        view.spacing = spacing
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    private func getTextField(placeholder: String, isPassword: Bool) -> UITextField {
        let view = UITextField()
        view.placeholder = placeholder
        view.clearButtonMode = .whileEditing
        view.autocapitalizationType = .none
        view.autocorrectionType = .no
        view.spellCheckingType = .no
        view.returnKeyType = .next
        view.borderStyle = .roundedRect
        view.isSecureTextEntry = isPassword
        view.backgroundColor = .white
        return view
    }
    
    private func getButton(title: String, action: Selector) -> UIButton {
        let view = UIButton()
        view.setTitle(title, for: .normal)
        view.setTitleColor(.blue, for: .normal)
        view.addTarget(self, action: action, for: .touchUpInside)
        return view
    }
    
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
    
    private func configureUI() {
        view.addSubview(verticalStackView)
        setup(stackView: verticalStackView,
              arrangedSubview: usernameTextField, passwordTextField, loginButton, horizontalStackView)
        setup(stackView: horizontalStackView,
              arrangedSubview: forgotUsernameButton, forgotPasswordButton)
        addConstaints()
        loginButton.titleLabel?.font = .systemFont(ofSize: 24, weight: .medium)
    }
    
    private func addConstaints() {
        NSLayoutConstraint.activate([
            verticalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    private func setup(stackView: UIStackView, arrangedSubview: UIView...) {
        arrangedSubview.forEach {
            stackView.addArrangedSubview($0)
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

