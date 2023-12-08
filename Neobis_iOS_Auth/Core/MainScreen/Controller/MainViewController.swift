//
//  MainViewController.swift
//  Neobis_iOS_Auth
//
//  Created by Alikhan Tursunbekov on 2/12/23.
//

import UIKit

class MainViewController: UIViewController {
    
    var isNewbie: Bool?
    var token: String?
    var viewModel: MainViewModelProtocol?
    let mainView = MainView(frame: UIScreen.main.bounds)
    
    init(isNewbie: Bool? = false, token: String? = nil, viewModel: MainViewModelProtocol? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.isNewbie = isNewbie
        self.token = token
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mainView)
        setupTargets()
        checkUser()
        
        if let token = token, let isNewbie = isNewbie, isNewbie {
            viewModel?.confirmUserAccount(token: token, complition: { res in
                switch res {
                case .success(let res):
                    print(res)
                case .failure(let error):
                    //self.view.showToast(message: "Не получилось подтвердить")
                    print(error)
                }
            })
        }
    }
    
    func checkUser() {
        if let check = isNewbie, !check {
            mainView.titleLabel.text = "С возвращением!"
        }
    }
    
    func setupTargets() {
        mainView.logOutButton.addTarget(self, action: #selector(leavePressed), for: .touchUpInside)
    }
    
    @objc func leavePressed() {
        let customAlertController = UINavigationController(rootViewController: CustomLogOutAlert(logOut: {
            if let isNewbie = self.isNewbie, isNewbie {
                self.dismiss(animated: true, completion: nil)
                self.navigationController?.popViewController(animated: true)
            } else {
                self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
            }
        }))
        customAlertController.modalPresentationStyle = .overFullScreen
        present(customAlertController, animated: false)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
