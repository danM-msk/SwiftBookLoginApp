//  Created by Daniyar Mamadov on 12.08.2022.

import UIKit

extension WelcomeViewController {
    
    internal func getLabel() -> UILabel {
        let view = UILabel()
        view.text = "👋🏼"
        view.textAlignment = .center
        view.textColor = .white
        view.font = .systemFont(ofSize: 24, weight: .bold)
        return view
    }
    
    internal func makeGradientBackground() {
        view.backgroundColor = .clear
        let gradientlayer = CAGradientLayer()
        gradientlayer.frame = self.view.bounds
        gradientlayer.colors = [UIColor.systemPink.cgColor, UIColor.purple.cgColor]
        self.view.layer.insertSublayer(gradientlayer, at: 0)
    }
    
    internal func configureUI() {
        view.addSubview(verticalStackView)
        setup(stackView: verticalStackView, arrangedSubview: welcomeLabel, emojiLabel, logoutButton)
        addConstraints()
    }
    
    private func addConstraints() {
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
}
