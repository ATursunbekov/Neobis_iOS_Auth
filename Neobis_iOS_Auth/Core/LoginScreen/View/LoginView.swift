//
//  LoginView.swift
//  Neobis_iOS_Auth
//
//  Created by Alikhan Tursunbekov on 29/11/23.
//

import UIKit
import SnapKit

class LoginView: UIView {
    
    lazy var logoImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "logo"))
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var welcomingMessage: UILabel = {
        let label = UILabel()
        label.text = "Вэлком бэк!"
        label.font = UIFont(name: "MPLUS1p-Medium", size: 24)
        return label
    }()
    
    lazy var loginView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.backgroundColor = UIColor(hex: "#F8F8F8")
        return view
    }()
    
    lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.defaultTextField(placeholder: "Введи туда-сюда логин")
        return textField
    }()
    
    lazy var passwordView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.backgroundColor = UIColor(hex: "#F8F8F8")
        return view
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.defaultTextField(placeholder: "Пароль (тоже введи)")
        textField.isSecureTextEntry = true
        return textField
    }()
    
    lazy var showPasswordButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "show"), for: .normal)
        return button
    }()
    
    lazy var enterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.layer.cornerRadius = 16
        button.backgroundColor = UIColor(hex: "#292929")
        button.titleLabel?.font = UIFont(name: "MPLUS1p-Medium", size: 16)
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("У меня еще нет аккаунта", for: .normal)
        button.titleLabel?.font = UIFont(name: "MPLUS1p-Medium", size: 16)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupConstraints()
    }
    
    func setupConstraints() {
        addSubview(logoImage)
        addSubview(welcomingMessage)
        addSubview(loginView)
        loginView.addSubview(loginTextField)
        addSubview(passwordView)
        passwordView.addSubview(passwordTextField)
        passwordView.addSubview(showPasswordButton)
        addSubview(enterButton)
        addSubview(registerButton)
        
        logoImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(70)
            make.width.equalTo(186)
            make.height.equalTo(194)
        }
        
        welcomingMessage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(logoImage.snp.bottom).offset(31)
        }
        
        loginView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(welcomingMessage.snp.bottom).offset(28)
            make.height.equalTo(52)
        }
        
        loginTextField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        passwordView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(loginView.snp.bottom).offset(15)
            make.height.equalTo(52)
        }
        
        showPasswordButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(15)
            make.height.equalTo(15)
            make.width.equalTo(21)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalTo(showPasswordButton.snp.leading).offset(-10)
            make.centerY.equalToSuperview()
        }
        
        enterButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(passwordView.snp.bottom).offset(24)
            make.height.equalTo(50)
        }
        
        registerButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(enterButton.snp.bottom).offset(28)
            make.height.equalTo(50)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
