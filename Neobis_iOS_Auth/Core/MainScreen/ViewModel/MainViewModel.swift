//
//  MainViewModel.swift
//  Neobis_iOS_Auth
//
//  Created by Alikhan Tursunbekov on 8/12/23.
//

import Foundation

protocol MainViewModelProtocol {
    func confirmUserAccount(token: String ,complition: @escaping (Result<String, NetworkError>) -> Void)
}

class MainViewModel: MainViewModelProtocol {
    var url = "http://backend-production-aaf6.up.railway.app/api/v1/auth/registerConfirm?"
    
    func confirmUserAccount(token: String ,complition: @escaping (Result<String, NetworkError>) -> Void) {
        url.append(token)
        let headerParameters = ["Content-Type": "application/json"]
        
        NetworkManager.request(urlString: url, method: .post,headers: headerParameters ,completion: complition)
    }
}
