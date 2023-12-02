//
//  ConfirmationViewController.swift
//  Neobis_iOS_Auth
//
//  Created by Alikhan Tursunbekov on 1/12/23.
//

import UIKit

class ConfirmationViewController: UIViewController {
    
    var userMail: String?
    
    let confirmView = ConfirmationView(frame: UIScreen.main.bounds)
    
    init(userMail: String) {
        super.init(nibName: nil, bundle: nil)
        self.userMail = userMail
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var backButton = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(popBack))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(confirmView)
        navigationItem.title = "Регистрация"
        backButton.tintColor = .black
        navigationItem.leftBarButtonItem = backButton
        setUserMail()
        setupTargets()
    }
    
    func setupTargets() {
        confirmView.resendLetterButton.addTarget(self, action: #selector(resendPressed), for: .touchUpInside)
    }
    
    func setUserMail() {
        confirmView.titleLabel.text?.append(userMail ?? "")
    }
    
    @objc func popBack() {
        dismiss(animated: true)
    }
    
    @objc func resendPressed() {
        let customAlertController = CustomAlertViewController()
        customAlertController.modalPresentationStyle = .overFullScreen
        present(customAlertController, animated: false)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            let vc = UINavigationController(rootViewController: MainViewController(isNewbie: true))
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
}
