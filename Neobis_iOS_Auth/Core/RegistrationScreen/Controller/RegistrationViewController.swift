//
//  RegistrationViewController.swift
//  Neobis_iOS_Auth
//
//  Created by Alikhan Tursunbekov on 29/11/23.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    lazy var registerView = RegistrationView(frame: UIScreen.main.bounds)
    lazy var backButton = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(popBack))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(registerView)
        navigationItem.title = "Регистрация"
        backButton.tintColor = .black
        navigationItem.leftBarButtonItem = backButton
    }
    
    func setupTargets() {
        
    }
    
    @objc func popBack() {
        dismiss(animated: true)
    }

}
