import UIKit
import SnapKit

class LoginView: UIView {
    
    var validData = true
    
    lazy var logoImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "logo"))
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var loginView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "#F7F7F8")
        view.layer.borderColor = UIColor(hex: "#F5F5F5").cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 8
        return view
    }()
    
    lazy var loginTextField: FloatingPlaceholderTextField = {
        let textField = FloatingPlaceholderTextField()
        textField.setPlaceholder("Электронная почта")
        let customFont = UIFont(name: "GothamPro-Medium", size: 16.0)
        let attributedPlaceholder = NSAttributedString(string: "Электронная почта", attributes: [
            NSAttributedString.Key.font: customFont,
            NSAttributedString.Key.foregroundColor: UIColor(hex: "#C1C1C1")
        ])
        textField.attributedPlaceholder = attributedPlaceholder
        textField.autocapitalizationType = .none
        textField.font = UIFont(name: "GothamPro-Medium", size: 16.0)
        textField.autocorrectionType = .no
        return textField
    }()
    
    lazy var passwordView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "#F7F7F8")
        view.layer.borderColor = UIColor(hex: "#F5F5F5").cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 8
        return view
    }()
    
    lazy var passwordTextField: FloatingPlaceholderTextField = {
        let textField = FloatingPlaceholderTextField()
        textField.setPlaceholder("Пароль")
        let customFont = UIFont(name: "GothamPro-Medium", size: 16.0)
        let attributedPlaceholder = NSAttributedString(string: "Пароль", attributes: [
            NSAttributedString.Key.font: customFont,
            NSAttributedString.Key.foregroundColor: UIColor(hex: "#C1C1C1")
        ])
        textField.attributedPlaceholder = attributedPlaceholder
        textField.autocapitalizationType = .none
        textField.font = UIFont(name: "GothamPro-Medium", size: 16.0)
        textField.autocorrectionType = .no
        textField.isSecureTextEntry = true
        textField.keyboardType = .numberPad
        return textField
    }()
    
    lazy var hidingPassword: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "closedEye"), for: .normal)
        button.tintColor = UIColor(hex: "#C1C1C1")
        return button
    }()
    
    lazy var enterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = UIColor(hex: "#F7F7F8")
        button.layer.cornerRadius = 16
        button.titleLabel?.font = UIFont(name: "GothamPro-Bold", size: 16)
        button.setTitleColor(UIColor(hex: "#9CA4AB"), for: .disabled)
        button.setTitleColor(.white, for: .normal)
        button.isEnabled = false
        return button
    }()
    
    lazy var forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Забыли пароль?", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "GothamPro-Bold", size: 16)        
        return button
    }()
    
    lazy var invalidDataLabel: UILabel = {
        let label = UILabel()
        label.text = "Неверный логин или пароль"
        label.textColor = .systemRed
        label.font = UIFont(name: "GothamPro-Medium", size: 16)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupConstraints()
        hidingPassword.addTarget(self, action: #selector(showPassword), for: .touchUpInside)
        passwordTextField.addTarget(self, action: #selector(passwordEditing), for: .editingChanged)
        loginTextField.addTarget(self, action: #selector(passwordEditing), for: .editingChanged)
        invalidDataLabel.isHidden = true
        enterButton.addTarget(self, action: #selector(enterPressed), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func showPassword() {
        if passwordTextField.isSecureTextEntry {
            hidingPassword.setImage(UIImage(named: "eye"), for: .normal)
            hidingPassword.tintColor = .black
        } else {
            passwordTextField.isSecureTextEntry = false
            hidingPassword.setImage(UIImage(named: "closedEye"), for: .normal)
            hidingPassword.tintColor = .gray
        }
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
    }
    
    @objc func passwordEditing() {
        UIView.animate(withDuration: 0.3) {
            if !self.passwordTextField.text!.isEmpty {
                self.hidingPassword.frame.origin.y = self.frame.origin.y + 30
            } else {
                self.hidingPassword.frame.origin.y = self.frame.origin.y + 20
            }
            let enterButtonState =  !self.loginTextField.text!.isEmpty && !self.passwordTextField.text!.isEmpty
            self.changeStateOfEnterButton(state: enterButtonState)
        }
        if !validData {
            incorrectData(correct: true)
        }
    }
    
    @objc func loginEditing() {
        UIView.animate(withDuration: 0.3) {
            let enterButtonState =  !self.loginTextField.text!.isEmpty && !self.passwordTextField.text!.isEmpty
            self.changeStateOfEnterButton(state: enterButtonState)
        }
        if !validData {
            incorrectData(correct: true)
        }
    }
    
    @objc func enterPressed() {
        incorrectData(correct: false)
    }
    
    func changeStateOfEnterButton(state: Bool) {
            enterButton.backgroundColor = !state ? UIColor(hex: "#F7F7F8") : UIColor(hex: "#5D5FEF")
            enterButton.isEnabled = state
    }
    
    func incorrectData(correct: Bool) {
        if !correct {
            loginTextField.textColor = .systemRed
            loginView.layer.borderColor = UIColor.systemRed.cgColor
            passwordView.layer.borderColor = UIColor.systemRed.cgColor
            passwordTextField.textColor = .systemRed
            hidingPassword.tintColor = .systemRed
            validData = false
            invalidDataLabel.isHidden = false
        } else {
            loginTextField.textColor = UIColor(hex: "#C1C1C1")
            loginView.layer.borderColor = UIColor(hex: "#F5F5F5").cgColor
            passwordView.layer.borderColor = UIColor(hex: "#F5F5F5").cgColor
            passwordTextField.textColor = UIColor(hex: "#C1C1C1")
            validData = true
            hidingPassword.tintColor = passwordTextField.isSecureTextEntry ? .gray : .black
            invalidDataLabel.isHidden = true
        }
    }
    
    func setupConstraints() {
        addSubview(logoImage)
        addSubview(loginView)
        loginView.addSubview(loginTextField)
        addSubview(passwordView)
        passwordView.addSubview(hidingPassword)
        passwordView.addSubview(passwordTextField)
        addSubview(enterButton)
        addSubview(forgotPasswordButton)
        addSubview(invalidDataLabel)
        
        logoImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(76)
            make.height.equalTo(120)
            make.width.equalTo(120)
        }
        
        loginView.snp.makeConstraints { make in
            make.top.equalTo(logoImage.snp.bottom).offset(40)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(60)
        }
        
        loginTextField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(10)
        }
        
        passwordView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(loginView.snp.bottom).offset(24)
            make.height.equalTo(60)
        }
        
        hidingPassword.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(10)
            make.height.equalTo(24)
            make.width.equalTo(24)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(10)
            make.trailing.equalTo(hidingPassword.snp.leading).inset(10)
        }
        
        enterButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(passwordView.snp.bottom).offset(60)
            make.height.equalTo(65)
        }
        
        forgotPasswordButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(enterButton.snp.bottom).offset(225)
        }
        
        invalidDataLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordView.snp.bottom).offset(18)
        }
    }
}

import UIKit

class FloatingPlaceholderTextField: UITextField {
    
    var yAxis: CGFloat = 0

    private let floatingLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hex: "#C1C1C1")
        label.font = UIFont(name: "GothamPro", size: 12)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }

    private func setupViews() {
        floatingLabel.alpha = 0.0
        addSubview(floatingLabel)
        addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
        updateFloatingLabel()
        yAxis = self.frame.origin.y + 20
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        updateFloatingLabel()
    }

    @objc private func textFieldEditingChanged() {
        let shouldShowFloatingLabel = !text!.isEmpty
        
        UIView.animate(withDuration: 0.3) {
            self.floatingLabel.alpha = shouldShowFloatingLabel ? 1.0 : 0.0
            if shouldShowFloatingLabel {
                self.frame.origin.y = self.yAxis + 10
            } else {
                self.frame.origin.y = self.yAxis
            }
        }
    }
    private func updateFloatingLabel() {
        let floatingLabelFrame = CGRect(x: 0, y: -20, width: bounds.size.width, height: bounds.size.height)
        floatingLabel.frame = floatingLabelFrame
    }
    
    func setPlaceholder(_ placeholder: String) {
        self.placeholder = placeholder
        floatingLabel.text = placeholder
        floatingLabel.sizeToFit()
    }
}


