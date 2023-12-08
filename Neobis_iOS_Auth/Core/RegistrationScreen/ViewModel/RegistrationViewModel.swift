//
//  RegistrationViewModel.swift
//  Neobis_iOS_Auth
//
//  Created by Alikhan Tursunbekov on 7/12/23.
//

import Foundation

protocol RegisterViewModelProtocol {
    
    func registerUser(email: String, username: String, password: String,complition: @escaping (Result<String, NetworkError>) -> Void)
    
}

class RegistrationViewModel: RegisterViewModelProtocol {
    
    let url = "https://backend-production-aaf6.up.railway.app/api/v1/auth/registration"
    
    func registerUser(email: String, username: String, password: String,complition: @escaping (Result<String, NetworkError>) -> Void) {
        let bodyParametrs = ["email": email, "username": username, "password": password]
        let headerParameters = ["Content-Type": "application/json"]
        
        NetworkManager.request(urlString: url,method: .post ,parameters: bodyParametrs, headers: headerParameters, completion: complition)
    }
}
