//
//  ResetPasswordViewController.swift
//  Neobis_iOS_Auth
//
//  Created by Alikhan Tursunbekov on 24/11/23.
//

import UIKit

class ResetPasswordViewController: UIViewController {

    let resetPasswordView = ResetPasswordScreenView(frame: UIScreen.main.bounds)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(resetPasswordView)
        navigationItem.title = "Сброс пароля"
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: resetPasswordView.backButton)
    }
}
