//
//  RegistrationViewController.swift
//  Neobis_iOS_Auth
//
//  Created by Alikhan Tursunbekov on 29/11/23.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    var viewModel: RegisterViewModelProtocol?
    
    init(viewModel: RegisterViewModelProtocol?) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var checkPassword1 = false
    var checkPassword2 = false
    var checkPassword3 = false
    var checkPassword4 = false
    
    lazy var registerView = RegistrationView(frame: UIScreen.main.bounds)
    lazy var backButton = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(popBack))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(registerView)
        navigationItem.title = "Регистрация"
        backButton.tintColor = .black
        navigationItem.leftBarButtonItem = backButton
        setupTargets()
    }
    
    func setupTargets() {
        registerView.firstrPasswordField.textField.addTarget(self, action: #selector(validationOfPassword), for: .editingChanged)
        registerView.firstrPasswordField.textField.addTarget(self, action: #selector(endValidationCheck), for: .editingDidEnd)
        registerView.firstrPasswordField.textField.addTarget(self, action: #selector(startValidationCheck), for: .editingDidBegin)
        registerView.secondPasswordField.textField.addTarget(self, action: #selector(checkCorrecnessOfSecondPassword), for: .editingDidEnd)
        registerView.secondPasswordField.textField.addTarget(self, action: #selector(editSecondPassword), for: .editingDidBegin)
        registerView.mailTextField.textField.addTarget(self, action: #selector(changeMail), for: .editingDidEnd)
        registerView.loginTextField.textField.addTarget(self, action: #selector(changelogin), for: .editingDidEnd)
        registerView.nextButton.addTarget(self, action: #selector(registerPressed), for: .touchUpInside)
    }
    
    @objc func validationOfPassword(_ textField: UITextField) {
        if let text = textField.text {
            if text.count >= 8 && text.count <= 15 && !checkPassword1{
                registerView.checkLabel1.textColor = .systemGreen
                registerView.checkLabel1.text?.append(" ✅")
                checkPassword1 = true
            } else if (text.count < 8 || text.count > 15) && checkPassword1 {
                registerView.checkLabel1.textColor = UIColor(hex: "#767676")
                registerView.checkLabel1.text?.removeLast(2)
                checkPassword1 = false
            }
            
            if containsLetters(in: text)  && !checkPassword2 {
                registerView.checkLabel2.textColor = .systemGreen
                registerView.checkLabel2.text?.append(" ✅")
                checkPassword2 = true
            } else if !containsLetters(in: text) && checkPassword2 {
                registerView.checkLabel2.textColor = UIColor(hex: "#767676")
                registerView.checkLabel2.text?.removeLast(2)
                checkPassword2 = false
            }
            
            if containsDigit(in: text) && !checkPassword3 {
                registerView.checkLabel3.textColor = .systemGreen
                registerView.checkLabel3.text?.append(" ✅")
                checkPassword3 = true
            } else if !containsDigit(in: text) && checkPassword3{
                registerView.checkLabel3.textColor = UIColor(hex: "#767676")
                registerView.checkLabel3.text?.removeLast(2)
                checkPassword3 = false
            }
            
            if containsSpecialCharacter(in: text) && !checkPassword4 {
                registerView.checkLabel4.textColor = .systemGreen
                registerView.checkLabel4.text?.append(" ✅")
                checkPassword4 = true
            } else if !containsSpecialCharacter(in: text) && checkPassword4 {
                registerView.checkLabel4.textColor = UIColor(hex: "#767676")
                registerView.checkLabel4.text?.removeLast(2)
                checkPassword4 = false
            }
        }
    }
    
    @objc func endValidationCheck() {
        if !checkPassword1 {
            registerView.checkLabel1.textColor = .systemRed
            registerView.checkLabel1.text?.append(" ❌")
        }
        
        if !checkPassword2 {
            registerView.checkLabel2.textColor = .systemRed
            registerView.checkLabel2.text?.append(" ❌")
        }
        
        if !checkPassword3 {
            registerView.checkLabel3.textColor = .systemRed
            registerView.checkLabel3.text?.append(" ❌")
        }
        
        if !checkPassword4 {
            registerView.checkLabel4.textColor = .systemRed
            registerView.checkLabel4.text?.append(" ❌")
        }
        
        if !checkPassword1 || !checkPassword2 || !checkPassword3 || !checkPassword4 {
            registerView.firstrPasswordField.textField.textColor = .systemRed
        }
        checkAllData()
    }
    
    @objc func startValidationCheck() {
        if registerView.checkLabel1.text!.contains("❌") && !checkPassword1 {
            registerView.checkLabel1.textColor = UIColor(hex: "#767676")
            registerView.checkLabel1.text?.removeLast(2)
        }
        
        if registerView.checkLabel2.text!.contains("❌") && !checkPassword2 {
            registerView.checkLabel2.textColor = UIColor(hex: "#767676")
            registerView.checkLabel2.text?.removeLast(2)
        }
        
        if registerView.checkLabel3.text!.contains("❌") && !checkPassword3 {
            registerView.checkLabel3.textColor = UIColor(hex: "#767676")
            registerView.checkLabel3.text?.removeLast(2)
        }
        
        if registerView.checkLabel4.text!.contains("❌") && !checkPassword4 {
            registerView.checkLabel4.textColor = UIColor(hex: "#767676")
            registerView.checkLabel4.text?.removeLast(2)
        }
        registerView.firstrPasswordField.textField.textColor = UIColor(hex: "#212121")
    }
    
    func containsSpecialCharacter(in string: String) -> Bool {
        let specialCharacters = CharacterSet(charactersIn: "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~")
        return string.rangeOfCharacter(from: specialCharacters) != nil
    }
    
    func containsLetters(in string: String) -> Bool {
        let letters = CharacterSet.letters
        return string.rangeOfCharacter(from: letters) != nil
    }
    
    func containsDigit(in string: String) -> Bool {
        let digits = CharacterSet.decimalDigits
        return string.rangeOfCharacter(from: digits) != nil
    }
    
    func checkAllData() {
        if  registerView.firstrPasswordField.textField.text == registerView.secondPasswordField.textField.text && checkPassword1 && checkPassword2 && checkPassword3 && checkPassword4 && !registerView.mailTextField.textField.text!.isEmpty && !registerView.loginTextField.textField.text!.isEmpty {
            registerView.nextButton.isEnabled = true
            registerView.nextButton.backgroundColor = .black
        } else {
            registerView.nextButton.isEnabled = false
            registerView.nextButton.backgroundColor = UIColor(hex: "#D7D7D7")
        }
    }
    
    @objc func checkCorrecnessOfSecondPassword() {
        if registerView.firstrPasswordField.textField.text != registerView.secondPasswordField.textField.text {
            registerView.wrongPasswordLabel.isHidden = false
            registerView.secondPasswordField.textField.textColor = .systemRed
            
            registerView.nextButton.snp.updateConstraints { make in
                make.top.equalTo(registerView.secondPasswordField.snp.bottom).offset(50)
            }
        }
        checkAllData()
    }
    
    @objc func editSecondPassword() {
        if !registerView.wrongPasswordLabel.isHidden {
            registerView.secondPasswordField.textField.textColor = UIColor(hex: "#212121")
            registerView.wrongPasswordLabel.isHidden = true
            
            registerView.nextButton.snp.updateConstraints { make in
                make.top.equalTo(registerView.secondPasswordField.snp.bottom).offset(25)
            }
        }
    }
    
    @objc func changeMail() {
        checkAllData()
    }
    
    @objc func changelogin() {
        checkAllData()
    }
    
    @objc func registerPressed() {
        if let email = registerView.mailTextField.textField.text, let username = registerView.loginTextField.textField.text, let password = registerView.firstrPasswordField.textField.text {
            viewModel?.registerUser(email: email, username: username, password: password, complition: { [weak self] result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let res):
                        print(res)
                        let vc = UINavigationController(rootViewController: ConfirmationViewController(email: email, username: username, password: password, viewModel: ConfirmationViewModel()))
                        vc.modalPresentationStyle = .fullScreen
                        self?.present(vc, animated: true)
                    case .failure(let error):
                        self?.view.showToast(message: "Неверный логин или пароль")
                        print(error)
                    }
                }
            })
        }
    }
    
    @objc func popBack() {
        dismiss(animated: true)
    }
    
}
