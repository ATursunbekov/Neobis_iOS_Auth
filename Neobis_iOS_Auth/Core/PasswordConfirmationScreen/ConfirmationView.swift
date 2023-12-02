//
//  ConfirmationView.swift
//  Neobis_iOS_Auth
//
//  Created by Alikhan Tursunbekov on 1/12/23.
//

import UIKit

class ConfirmationView: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Выслали письмо со ссылкой для завершения регистрации на "
        label.font = UIFont(name: "MPLUS1p-Medium", size: 20)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = """
        Если письмо не пришло, не спеши
        ждать совиную почту - лучше проверь
        ящик “Спам”

        (´｡• ω •｡`)
        """
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor(hex: "#767676")
        label.font = UIFont(name: "MPLUS1p-Medium", size: 16)
        return label
    }()
    
    lazy var logoImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "confirm"))
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var resendLetterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Письмо не пришло", for: .normal)
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
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(logoImage)
        addSubview(resendLetterButton)
        
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalToSuperview().offset(136)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(titleLabel.snp.bottom).offset(24)
        }
        
        logoImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(descriptionLabel.snp.bottom).offset(58)
            make.height.equalTo(231)
            make.width.equalTo(224)
        }
        
        resendLetterButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(logoImage.snp.bottom).offset(70)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
