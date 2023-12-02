//
//  MainViewController.swift
//  Neobis_iOS_Auth
//
//  Created by Alikhan Tursunbekov on 2/12/23.
//

import UIKit

class MainViewController: UIViewController {
    
    var isNewbie: Bool?
    
    init(isNewbie: Bool? = false) {
        super.init(nibName: nil, bundle: nil)
        self.isNewbie = isNewbie
    }
    
    let mainView = MainView(frame: UIScreen.main.bounds)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mainView)
        setupTargets()
        checkUser()
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
        let customAlertController = UINavigationController(rootViewController: CustomLogOutAlert())
        customAlertController.modalPresentationStyle = .overFullScreen
        present(customAlertController, animated: false)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
