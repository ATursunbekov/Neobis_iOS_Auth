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
    
    lazy var loginTextField: CustomLoginTextField = {
        let textField = CustomLoginTextField()
        textField.textField.defaultTextField(placeholder: "Введи туда-сюда логин")
        return textField
    }()
    
    lazy var passwordTextField: CustomSecureTextField = {
        let textField = CustomSecureTextField()
        textField.textField.defaultTextField(placeholder: "Пароль (тоже введи)")
        return textField
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
        addSubview(loginTextField)
        addSubview(passwordTextField)
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
        
        loginTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(welcomingMessage.snp.bottom).offset(28)
            make.height.equalTo(52)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(loginTextField.snp.bottom).offset(15)
            make.height.equalTo(52)
        }
        
        enterButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(passwordTextField.snp.bottom).offset(24)
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
