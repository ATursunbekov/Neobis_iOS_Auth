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
        loginView.showPasswordButton.addTarget(self, action: #selector(showPasswordPressed), for: .touchUpInside)
        loginView.enterButton.addTarget(self, action: #selector(enterPressed), for: .touchUpInside)
        loginView.registerButton.addTarget(self, action: #selector(registerPressed), for: .touchUpInside)
    }
    
    @objc func showPasswordPressed() {
        loginView.passwordTextField.isSecureTextEntry.toggle()
        let check = loginView.passwordTextField.isSecureTextEntry
        loginView.showPasswordButton.setImage(UIImage(named: check ? "show" : "hide"), for: .normal)
        loginView.showPasswordButton.snp.updateConstraints { make in
                make.height.equalTo(check ? 15 : 20)
            }
        
        UIView.animate(withDuration: 0.3) {
            self.loginView.layoutIfNeeded()
        }
    }
    
    @objc func enterPressed() {
        self.view.showToast(message: "Неверный логин или пароль")
    }
    
    @objc func registerPressed() {
        let vc = UINavigationController(rootViewController: RegistrationViewController())
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}
