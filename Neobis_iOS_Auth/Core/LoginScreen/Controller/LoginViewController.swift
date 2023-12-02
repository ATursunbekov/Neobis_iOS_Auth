//
//  LoginViewController.swift
//  Neobis_iOS_Auth
//
//  Created by Alikhan Tursunbekov on 29/11/23.
//

import UIKit

class LoginViewController: UIViewController {

    let loginView = LoginView(frame: UIScreen.main.bounds)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(loginView)
        setupTargets()
    }

    func setupTargets() {
        loginView.enterButton.addTarget(self, action: #selector(enterPressed), for: .touchUpInside)
        loginView.registerButton.addTarget(self, action: #selector(registerPressed), for: .touchUpInside)
    }
    
    @objc func enterPressed() {
        if loginView.loginTextField.textField.text!.isEmpty || loginView.passwordTextField.textField.text!.isEmpty {
            self.view.showToast(message: "Неверный логин или пароль")
        } else {
            let vc = UINavigationController(rootViewController: MainViewController())
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
    }
    
    @objc func registerPressed() {
        let vc = UINavigationController(rootViewController: RegistrationViewController())
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}
