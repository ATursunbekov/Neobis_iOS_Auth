import Foundation

enum NetworkError: Error {
    case invalidURL
    case requestFailed(Error)
    case invalidResponse
    case decodingFailed(Error)
}

struct NetworkManager {
    
    static func request<T: Decodable>(
        urlString: String,
        method: HTTPMethod = .post,
        parameters: [String: Any]? = nil,
        headers: [String: String]? = nil,
        completion: @escaping (Result<T, NetworkError>) -> Void
    ) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        // Set headers if provided
        headers?.forEach { key, value in
            request.addValue(value, forHTTPHeaderField: key)
        }
        //request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Set HTTP body if there are parameters for POST requests
        do {
            if method == .post, let parameters = parameters {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
            }
        } catch {
            completion(.failure(.requestFailed(error)))
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(.requestFailed(error)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                print("StatusCode: \(httpResponse.statusCode)")
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidResponse))
                return
            }
            if T.self == String.self {
                if let responseString = String(data: data, encoding: .utf8) {
                    completion(.success(responseString as! T))
                } else {
                    completion(.failure(.decodingFailed(NSError(domain: "YourDomain", code: 100, userInfo: nil))))
                }
            } else {
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(.decodingFailed(error)))
                }
            }
        }
        
        task.resume()
    }
}

//let apiUrl = URL(string: "https://jsonplaceholder.typicode.com/posts/1")!
//
//NetworkManager.request(url: apiUrl, method: .get) { (result: Result<Post, NetworkError>) in
//    switch result {
//    case .success(let post):
//        print("Post title: \(post.title)")
//    case .failure(let error):
//        print("Error: \(error)")
//    }
//}
