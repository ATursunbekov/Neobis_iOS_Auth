//
//  LoginViewController.swift
//  Neobis_iOS_Auth
//
//  Created by Alikhan Tursunbekov on 22/11/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginView = LoginView(frame: UIScreen.main.bounds)
    
    var validData = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(loginView)
        setupTargets()
    }
    
    func changeStateOfEnterButton(state: Bool) {
        loginView.enterButton.backgroundColor = !state ? UIColor(hex: "#F7F7F8") : UIColor(hex: "#5D5FEF")
        loginView.enterButton.isEnabled = state
    }
    
    func incorrectData(correct: Bool) {
        if !correct {
            loginView.loginTextField.textColor = .systemRed
            loginView.loginView.layer.borderColor = UIColor.systemRed.cgColor
            loginView.passwordView.layer.borderColor = UIColor.systemRed.cgColor
            loginView.passwordTextField.textColor = .systemRed
            loginView.hidingPassword.tintColor = .systemRed
            validData = false
            loginView.invalidDataLabel.isHidden = false
        } else {
            loginView.loginTextField.textColor = UIColor(hex: "#C1C1C1")
            loginView.layer.borderColor = UIColor(hex: "#F5F5F5").cgColor
            loginView.passwordView.layer.borderColor = UIColor(hex: "#F5F5F5").cgColor
            loginView.passwordTextField.textColor = UIColor(hex: "#C1C1C1")
            validData = true
            loginView.hidingPassword.tintColor = loginView.passwordTextField.isSecureTextEntry ? .gray : .black
            loginView.invalidDataLabel.isHidden = true
        }
    }
    
    func setupTargets() {
        loginView.hidingPassword.addTarget(self, action: #selector(showPassword), for: .touchUpInside)
        loginView.passwordTextField.addTarget(self, action: #selector(passwordEditing), for: .editingChanged)
        loginView.loginTextField.addTarget(self, action: #selector(passwordEditing), for: .editingChanged)
        loginView.enterButton.addTarget(self, action: #selector(enterPressed), for: .touchUpInside)
        loginView.forgotPasswordButton.addTarget(self, action: #selector(resetPasswordPressed), for: .touchUpInside)
    }
    
    @objc func showPassword() {
        if loginView.passwordTextField.isSecureTextEntry {
            loginView.hidingPassword.setImage(UIImage(named: "eye"), for: .normal)
            loginView.hidingPassword.tintColor = .black
        } else {
            loginView.passwordTextField.isSecureTextEntry = false
            loginView.hidingPassword.setImage(UIImage(named: "closedEye"), for: .normal)
            loginView.hidingPassword.tintColor = .gray
        }
        loginView.passwordTextField.isSecureTextEntry = !loginView.passwordTextField.isSecureTextEntry
    }
    
    @objc func passwordEditing() {
        UIView.animate(withDuration: 0.3) {
            if !self.loginView.passwordTextField.text!.isEmpty {
                self.loginView.hidingPassword.frame.origin.y = self.loginView.frame.origin.y + 30
            } else {
                self.loginView.hidingPassword.frame.origin.y = self.loginView.frame.origin.y + 20
            }
            let enterButtonState =  !self.loginView.loginTextField.text!.isEmpty && !self.loginView.passwordTextField.text!.isEmpty
            self.changeStateOfEnterButton(state: enterButtonState)
        }
        if !validData {
            incorrectData(correct: true)
        }
    }
    
    @objc func loginEditing() {
        UIView.animate(withDuration: 0.3) {
            let enterButtonState =  !self.loginView.loginTextField.text!.isEmpty && !self.loginView.passwordTextField.text!.isEmpty
            self.changeStateOfEnterButton(state: enterButtonState)
        }
        if !validData {
            incorrectData(correct: true)
        }
    }
    
    @objc func enterPressed() {
        incorrectData(correct: false)
    }
    
    @objc func resetPasswordPressed() {
        let vc = UINavigationController(rootViewController: ResetPasswordViewController())
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}
