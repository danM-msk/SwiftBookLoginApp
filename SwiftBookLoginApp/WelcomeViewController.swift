//  Created by Daniyar Mamadov on 12.08.2022.

import UIKit

final internal class WelcomeViewController: UIViewController {
    
    internal let verticalStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillEqually
        view.spacing = 40
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    internal lazy var welcomeLabel: UILabel = {
        getLabel()
    }()
    
    internal lazy var emojiLabel: UILabel = {
        getLabel()
    }()
    
    internal lazy var logoutButton: UIButton = {
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
    
 
    
    @objc private func logoutButtonTapped() {
        let loginViewController = LoginViewController()
        loginViewController.modalTransitionStyle = .flipHorizontal
        loginViewController.modalPresentationStyle = .fullScreen
        present(loginViewController, animated: true, completion: nil)
    }
    

}
