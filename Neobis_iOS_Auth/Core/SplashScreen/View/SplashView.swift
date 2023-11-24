//
//  SplashView.swift
//  Neobis_iOS_Auth
//
//  Created by Alikhan Tursunbekov on 22/11/23.
//

import UIKit
import SnapKit

class SplashView: UIView {
    
    lazy var logoImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "logo"))
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        let text = """
        Смейся
        и улыбайся
        каждый день
        """
        let attributedText = NSMutableAttributedString(string: text)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 14
        attributedText.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedText.length))
        label.attributedText = attributedText
        label.numberOfLines = 0
        label.font = UIFont(name: "GothamPro-Medium", size: 40)
        label.textColor = UIColor(hex: "#5D5FEF")
        
        return label
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Начать пользоваться", for: .normal)
        button.titleLabel?.font = UIFont(name: "GothamPro-Bold", size: 16)
        button.layer.cornerRadius = 16
        button.backgroundColor = UIColor(hex: "#5D5FEF")
        return button
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.gray, for: .focused)
        button.setTitle("Есть аккаунт? Войти", for: .normal)
        button.titleLabel?.font = UIFont(name: "GothamPro-Bold", size: 16)
        return button
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        addSubview(logoImage)
        addSubview(titleLabel)
        addSubview(registerButton)
        addSubview(loginButton)
        
        logoImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(154)
            make.height.equalTo(200)
            make.width.equalTo(200)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(logoImage.snp.bottom).offset(60)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        registerButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(70)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(65)
        }
        
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(registerButton.snp.bottom).offset(45)
        }
    }
}
