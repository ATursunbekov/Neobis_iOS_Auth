//
//  ResetPasswordScreenView.swift
//  Neobis_iOS_Auth
//
//  Created by Alikhan Tursunbekov on 24/11/23.
//

import UIKit

class ResetPasswordScreenView: UIView {
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 50
        button.backgroundColor = UIColor(hex: "#C0C0C033", alpha: 0.2)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupConstraints()
    }
    
    func setupConstraints() {
        addSubview(backButton)
        
        backButton.snp.makeConstraints { make in
            make.height.equalTo(28)
            make.width.equalTo(44)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
