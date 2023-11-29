//
//  Extention+TextField.swift
//  Neobis_iOS_Auth
//
//  Created by Alikhan Tursunbekov on 29/11/23.
//

import Foundation
import UIKit

extension UITextField {
    func defaultTextField(placeholder: String) {
        self.placeholder = placeholder
        let customFont = UIFont(name: "MPLUS1p-Medium", size: 16)
        let attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [
            NSAttributedString.Key.font: customFont,
            NSAttributedString.Key.foregroundColor: UIColor(hex: "#767676")
        ])
        self.attributedPlaceholder = attributedPlaceholder
        self.autocapitalizationType = .none
        self.font = UIFont(name: "MPLUS1p-Medium", size: 16.0)
        self.autocorrectionType = .no
    }
}
