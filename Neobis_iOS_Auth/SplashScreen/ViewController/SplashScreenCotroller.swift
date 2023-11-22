//
//  ViewController.swift
//  Neobis_iOS_Auth
//
//  Created by Alikhan Tursunbekov on 22/11/23.
//

import UIKit

class SplashScreenCotroller: UIViewController {

    let splashScreenView = SplashView(frame: UIScreen.main.bounds)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(splashScreenView)
        setupTargets()
    }

    func setupTargets() {
        splashScreenView.loginButton.addTarget(self, action: #selector(goToLoginScreen), for: .touchUpInside)
        splashScreenView.registerButton.addTarget(self, action: #selector(goToRegisterScreen), for: .touchUpInside)
    }

    
    @objc func goToLoginScreen() {
        let vc = UINavigationController(rootViewController: LoginViewController())
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    @objc func goToRegisterScreen() {
        print("hi")
    }
}

