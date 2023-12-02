//
//  RegistrationView.swift
//  Neobis_iOS_Auth
//
//  Created by Alikhan Tursunbekov on 29/11/23.

import UIKit

class RegistrationView: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = """
        Создать аккаунт
        Lorby
        """
        label.font = UIFont(name: "MPLUS1p-Medium", size: 24)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    lazy var mailTextField: CustomLoginTextField = {
        let textField = CustomLoginTextField()
        textField.textField.defaultTextField(placeholder: "Введи адрес почты")
        return textField
    }()
    
    lazy var loginTextField: CustomLoginTextField = {
        let textField = CustomLoginTextField()
        textField.textField.defaultTextField(placeholder: "Придумай логин")
        return textField
    }()
    
    lazy var firstrPasswordField: CustomSecureTextField = {
        let textField = CustomSecureTextField()
        textField.textField.defaultTextField(placeholder: "Создай пароль")
        return textField
    }()
    
    lazy var secondPasswordField: CustomSecureTextField = {
        let textField = CustomSecureTextField()
        textField.textField.defaultTextField(placeholder: "Повтори пароль")
        return textField
    }()
    
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.setTitle("Далее", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(UIColor(hex: "#767676"), for: .disabled)
        button.backgroundColor = UIColor.init(hex: "#D7D7D7")
        return button
    }()
    
    lazy var checkLabel1: UILabel = {
        let label = UILabel()
        label.text = " · От 8 до 15 символов"
        label.font = UIFont(name: "MPLUS1p-Medium", size: 12)
        label.textColor = UIColor(hex: "#767676")
        return label
    }()
    
    lazy var checkLabel2: UILabel = {
        let label = UILabel()
        label.text = " · Строчные и прописные буквы"
        label.font = UIFont(name: "MPLUS1p-Medium", size: 12)
        label.textColor = UIColor(hex: "#767676")
        return label
    }()
    
    lazy var checkLabel3: UILabel = {
        let label = UILabel()
        label.text = " · Минимум 1 цифра"
        label.font = UIFont(name: "MPLUS1p-Medium", size: 12)
        label.textColor = UIColor(hex: "#767676")
        return label
    }()
    
    lazy var checkLabel4: UILabel = {
        let label = UILabel()
        label.text = " · Минимум 1 спецсимвол (!, \", #, $...)"
        label.font = UIFont(name: "MPLUS1p-Medium", size: 12)
        label.textColor = UIColor(hex: "#767676")
        return label
    }()
    
    lazy var wrongPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Пароли не совпадают"
        label.textColor = .systemRed
        label.font = UIFont(name: "MPLUS1p-Medium", size: 12)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupConstraints()
    }
    
    func setupConstraints() {
        addSubview(titleLabel)
        addSubview(mailTextField)
        addSubview(loginTextField)
        addSubview(nextButton)
        addSubview(checkLabel1)
        addSubview(checkLabel2)
        addSubview(checkLabel3)
        addSubview(checkLabel4)
        addSubview(firstrPasswordField)
        addSubview(secondPasswordField)
        addSubview(wrongPasswordLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(50)
            make.top.equalToSuperview().offset(140)
        }
        
        mailTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(40)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(52)
        }
        
        loginTextField.snp.makeConstraints { make in
            make.top.equalTo(mailTextField.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(52)
        }
        
        firstrPasswordField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(loginTextField.snp.bottom).offset(15)
            make.height.equalTo(52)
        }
        
        checkLabel1.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(firstrPasswordField.snp.bottom).offset(15)
        }
        
        checkLabel2.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(checkLabel1.snp.bottom).offset(14)
        }
        
        checkLabel3.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(checkLabel2.snp.bottom).offset(14)
        }
        
        checkLabel4.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(checkLabel3.snp.bottom).offset(14)
        }
        
        secondPasswordField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(checkLabel4.snp.bottom).offset(15)
            make.height.equalTo(52)
        }
        
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(secondPasswordField.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
        
        wrongPasswordLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(secondPasswordField.snp.bottom).offset(8)
        }
        
        wrongPasswordLabel.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
