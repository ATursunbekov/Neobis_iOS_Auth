//
//  LoginViewController.swift
//  Neobis_iOS_Auth
//
//  Created by Alikhan Tursunbekov on 22/11/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginView = LoginView(frame: UIScreen.main.bounds)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(loginView)
    }
}
