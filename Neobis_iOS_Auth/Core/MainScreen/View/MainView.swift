//
//  MainView.swift
//  Neobis_iOS_Auth
//
//  Created by Alikhan Tursunbekov on 2/12/23.
//

import UIKit

class MainView: UIView {

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Добро пожаловать! "
        label.font = UIFont(name: "MPLUS1p-Medium", size: 24)
        label.textAlignment = .center
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorby - твой личный репетитор"
        label.textAlignment = .center
        label.font = UIFont(name: "MPLUS1p-Regular", size: 20)
        return label
    }()
    
    lazy var logoImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "illustration"))
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var logOutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Выйти", for: .normal)
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
        addSubview(logOutButton)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(162)
            make.leading.trailing.equalToSuperview().inset(33)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(33)
        }
        
        logoImage.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(48)
            make.centerX.equalToSuperview()
            make.height.equalTo(315)
            make.width.equalTo(296)
        }
        
        logOutButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(logoImage.snp.bottom).offset(126)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
