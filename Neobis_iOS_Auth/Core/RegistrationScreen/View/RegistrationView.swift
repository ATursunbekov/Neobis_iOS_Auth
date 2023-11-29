//
//  RegistrationView.swift
//  Neobis_iOS_Auth
//
//  Created by Alikhan Tursunbekov on 29/11/23.
//

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
    
    lazy var mailView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.backgroundColor = UIColor(hex: "#F8F8F8")
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(hex: "#F8F8F8").cgColor
        return view
    }()
    
    lazy var loginView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.backgroundColor = UIColor(hex: "#F8F8F8")
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(hex: "#F8F8F8").cgColor
        return view
    }()
    
    lazy var passwordView1: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.backgroundColor = UIColor(hex: "#F8F8F8")
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(hex: "#F8F8F8").cgColor
        return view
    }()
    
    lazy var passwordView2: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.backgroundColor = UIColor(hex: "#F8F8F8")
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(hex: "#F8F8F8").cgColor
        return view
    }()
    
    lazy var mailTextField: UITextField = {
        let textField = UITextField()
        textField.defaultTextField(placeholder: "Введи адрес почты")
        return textField
    }()
    
    lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.defaultTextField(placeholder: "Придумай логин")
        return textField
    }()
    
    lazy var passwordTextfield1: UITextField = {
        let textField = UITextField()
        textField.defaultTextField(placeholder: "Создай пароль")
        textField.isSecureTextEntry = true
        return textField
    }()
    
    lazy var passwordTextfield2: UITextField = {
        let textField = UITextField()
        textField.defaultTextField(placeholder: "Повтори пароль")
        textField.isSecureTextEntry = true
        return textField
    }()
    
    lazy var passwordFieldButton1: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "show"), for: .normal)
        return button
    }()
    
    lazy var passwordFieldButton2: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "show"), for: .normal)
        return button
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

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupConstraints()
    }
    
    func setupConstraints() {
        addSubview(titleLabel)
        addSubview(mailView)
        addSubview(loginView)
        addSubview(passwordView1)
        addSubview(passwordView2)
        addSubview(nextButton)
        addSubview(checkLabel1)
        addSubview(checkLabel2)
        addSubview(checkLabel3)
        addSubview(checkLabel4)
        mailView.addSubview(mailTextField)
        loginView.addSubview(loginTextField)
        passwordView1.addSubview(passwordTextfield1)
        passwordView1.addSubview(passwordFieldButton1)
        passwordView2.addSubview(passwordTextfield2)
        passwordView2.addSubview(passwordFieldButton2)
        
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(50)
            make.top.equalToSuperview().offset(140)
        }
        
        mailView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(titleLabel.snp.bottom).offset(40)
            make.height.equalTo(52)
        }
        
        mailTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }
        
        loginView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(mailView.snp.bottom).offset(15)
            make.height.equalTo(52)
        }
        
        loginTextField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        passwordView1.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(loginView.snp.bottom).offset(15)
            make.height.equalTo(52)
        }
        
        passwordFieldButton1.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(15)
            make.width.equalTo(21)
        }
        
        passwordTextfield1.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalTo(passwordFieldButton1.snp.leading).offset(-10)
        }
        
        checkLabel1.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(passwordView1.snp.bottom).offset(15)
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
        
        passwordView2.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(checkLabel4.snp.bottom).offset(15)
            make.height.equalTo(52)
        }
        
        passwordFieldButton2.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(15)
            make.width.equalTo(21)
        }
        
        passwordTextfield2.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalTo(passwordFieldButton2.snp.leading).offset(-10)
        }
        
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(passwordView2.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
