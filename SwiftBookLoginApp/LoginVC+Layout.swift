//  Created by Daniyar Mamadov on 12.08.2022.

import UIKit

extension LoginViewController {
    
    internal func getStackView(axis: NSLayoutConstraint.Axis, spacing: CGFloat) -> UIStackView {
        let view = UIStackView()
        view.axis = axis
        view.distribution = .fillEqually
        view.spacing = spacing
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    internal func getTextField(placeholder: String, isPassword: Bool) -> UITextField {
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
    
    internal func getButton(title: String, action: Selector) -> UIButton {
        let view = UIButton()
        view.setTitle(title, for: .normal)
        view.setTitleColor(.blue, for: .normal)
        view.addTarget(self, action: action, for: .touchUpInside)
        return view
    }
    
    internal func configureUI() {
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
    
    internal func setup(stackView: UIStackView, arrangedSubview: UIView...) {
        arrangedSubview.forEach {
            stackView.addArrangedSubview($0)
        }
    }
}
