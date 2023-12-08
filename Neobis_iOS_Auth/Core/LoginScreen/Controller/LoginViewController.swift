//
//  LoginViewController.swift
//  Neobis_iOS_Auth
//
//  Created by Alikhan Tursunbekov on 29/11/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginView = LoginView(frame: UIScreen.main.bounds)
    
    var loginViewModel: LoginViewModelProtocol?
    
    init(loginViewModel: LoginViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.loginViewModel = loginViewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(loginView)
        setupTargets()
        setupComplitionHandlers()
    }
    
    func setupTargets() {
        loginView.enterButton.addTarget(self, action: #selector(enterPressed), for: .touchUpInside)
        loginView.registerButton.addTarget(self, action: #selector(registerPressed), for: .touchUpInside)
    }
    
    func setupComplitionHandlers() {
        loginViewModel?.checkUserData = { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let token):
                    print("Seccess, your token: \(token.token)")
                    let vc = UINavigationController(rootViewController: MainViewController())
                    vc.modalPresentationStyle = .fullScreen
                    self?.present(vc, animated: true)
                case .failure(let error):
                    self?.view.showToast(message: "Неверный логин или пароль")
                    print(error)
                }
            }
        }
    }
    
    @objc func enterPressed() {
        guard let username = loginView.loginTextField.textField.text, let password = loginView.passwordTextField.textField.text else {
            return
        }
        loginViewModel?.loginUser(username: username, password: password)
    }
    
    @objc func registerPressed() {
        let vc = UINavigationController(rootViewController: RegistrationViewController(viewModel: RegistrationViewModel()))
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
