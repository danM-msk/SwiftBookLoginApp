//  Created by Daniyar Mamadov on 12.08.2022.

import UIKit

final internal class WelcomeViewController: UIViewController {
    
    private let verticalStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillEqually
        view.spacing = 40
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var welcomeLabel: UILabel = {
        getLabel()
    }()
    
    private lazy var emojiLabel: UILabel = {
        getLabel()
    }()
    
    private lazy var logoutButton: UIButton = {
        let view = UIButton()
        view.setTitle("Log Out", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.titleLabel?.font = .systemFont(ofSize: 24, weight: .medium)
        view.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        return view
    }()
    
    init(username: String) {
        super.init(nibName: nil, bundle: nil)
        self.welcomeLabel.text = "Welcome, \(username)!"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeGradientBackground()
        configureUI()
    }
    
    private func getLabel() -> UILabel {
        let view = UILabel()
        view.text = "👋🏼"
        view.textAlignment = .center
        view.textColor = .white
        view.font = .systemFont(ofSize: 24, weight: .bold)
        return view
    }
    
    @objc private func logoutButtonTapped() {
        let loginViewController = LoginViewController()
        loginViewController.modalTransitionStyle = .flipHorizontal
        loginViewController.modalPresentationStyle = .fullScreen
        present(loginViewController, animated: true, completion: nil)
    }
    
    private func makeGradientBackground() {
        view.backgroundColor = .clear
        let gradientlayer = CAGradientLayer()
        gradientlayer.frame = self.view.bounds
        gradientlayer.colors = [UIColor.systemPink.cgColor, UIColor.purple.cgColor]
        self.view.layer.insertSublayer(gradientlayer, at: 0)
    }
    
    private func configureUI() {
        view.addSubview(verticalStackView)
        setup(stackView: verticalStackView, arrangedSubview: welcomeLabel, emojiLabel, logoutButton)
        addConstraints()
    }
    
    private func setup(stackView: UIStackView, arrangedSubview: UIView...) {
        arrangedSubview.forEach {
            stackView.addArrangedSubview($0)
        }
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            verticalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}
