//
//  LoginViewModel.swift
//  Neobis_iOS_Auth
//
//  Created by Alikhan Tursunbekov on 5/12/23.
//

import Foundation

protocol LoginViewModelProtocol {
    var checkUserData: ((Result<LoginResponse, NetworkError>) -> Void)? { get set }
    func loginUser(username: String, password: String)
}

class LoginViewModel: LoginViewModelProtocol {
    private let loginURL = "https://backend-production-aaf6.up.railway.app/api/v1/auth/authenticate"
    
    var checkUserData: ((Result<LoginResponse, NetworkError>) -> Void)?
    
    func loginUser(username: String, password: String) {
        let bodyParametrs = ["username": username, "password": password]
        let headerParameters = ["Content-Type": "application/json"]
        if let checkUserData = checkUserData {
            NetworkManager.request(urlString: loginURL,method: .post ,parameters: bodyParametrs, headers: headerParameters, completion: checkUserData)
        }
    }
}
