//
//  ConfirmationViewController.swift
//  Neobis_iOS_Auth
//
//  Created by Alikhan Tursunbekov on 1/12/23.
//

import UIKit

class ConfirmationViewController: UIViewController {
    
    var viewModel: ConfirmationViewModelProtocol?
    var email: String?
    var username: String?
    var password: String?
    
    
    let confirmView = ConfirmationView(frame: UIScreen.main.bounds)
    
    init(email: String? = nil, username: String? = nil, password: String? = nil, viewModel: ConfirmationViewModelProtocol? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.email = email
        self.username = username
        self.password = password
        self.viewModel = viewModel
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
        sendConfirmationRequest()
    }
    
    func setupTargets() {
        confirmView.resendLetterButton.addTarget(self, action: #selector(resendPressed), for: .touchUpInside)
    }
    
    func setUserMail() {
        confirmView.titleLabel.text?.append(email ?? "")
    }
    
    func sendConfirmationRequest() {
        if let email = email, let username = username, let password = password {
            viewModel?.sendLink(email: email, username: username, password: password, complition: { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let res):
                        print(res)
                    case .failure(let error):
                        self.view.showToast(message: "Неверный логин или пароль")
                        print(error)
                    }
                }
            })
        }
    }
    
    @objc func popBack() {
        dismiss(animated: true)
    }
    
    @objc func resendPressed() {
        let customAlertController = CustomAlertViewController()
        customAlertController.modalPresentationStyle = .overFullScreen
        present(customAlertController, animated: false)
        sendConfirmationRequest()
    }
}
