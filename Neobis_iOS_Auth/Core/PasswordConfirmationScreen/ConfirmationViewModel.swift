//
//  ConfirmationViewModel.swift
//  Neobis_iOS_Auth
//
//  Created by Alikhan Tursunbekov on 8/12/23.
//

import Foundation

protocol ConfirmationViewModelProtocol {
    func sendLink(email: String, username: String, password: String,complition: @escaping (Result<String, NetworkError>) -> Void)
}

class ConfirmationViewModel: ConfirmationViewModelProtocol {
    let url = "https://backend-production-aaf6.up.railway.app/api/v1/auth/send-message?link=neobisAuth://confirmationUserAccount"
    
    func sendLink(email: String, username: String, password: String,complition: @escaping (Result<String, NetworkError>) -> Void) {
        let bodyParametrs = ["email": email, "username": username, "password": password]
        let headerParameters = ["Content-Type": "application/json"]
        
        NetworkManager.request(urlString: url,method: .post ,parameters: bodyParametrs, headers: headerParameters, completion: complition)
    }
}
