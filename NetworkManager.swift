//
//  NetworkManager.swift
//  testtask
//
//  Created by Екатерина Вишневская on 20.11.2020.
//

import UIKit

class NetworkManager: NSObject {
    
    static let networkManager = NetworkManager();
    
    enum HTTPMethod {
        static let put = "PUT"
        static let get = "GET"
        static let post = "POST"
    }
    
    enum NetworkErrors: Error {
        case commonNetworkError
    }
    
    func requestGet (urlString: String, completion: @escaping (Result<Data?, NetworkErrors>) -> Void) {
        guard let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            
            if error != nil || data == nil {
                completion(.failure(.commonNetworkError))
                print("Client error!")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(.commonNetworkError))
                print("Server Error!")
                return
            }
            
            guard (200...299).contains(response.statusCode) else {
                print("Server error \(response.statusCode)!")
                return
            }
            print("Status Code: \(response.statusCode)")
            
            
            if let data = data {completion(.success(data))
            } else {
                completion(.failure(.commonNetworkError))
                return
            }
        })
        
        task.resume()
    }
    
    func requestPut (urlString: String, body: Data?, completion: @escaping (Result<Data?, NetworkErrors>) -> Void) {
        let session = URLSession.shared
        let url = URL(string: urlString)!
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.put
        request.httpBody = body
        
        let task = session.dataTask(with: request) { data, response, error in
            if error != nil {
                completion(.failure(.commonNetworkError))
                print("Client error!")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(.commonNetworkError))
                print("Server Error!")
                return
            }
            
            guard (200...299).contains(response.statusCode) else {
                print("Server error \(response.statusCode)!")
                return
            }
            print("Status Code: \(response.statusCode)")
            
            if let data = data {completion(.success(data))
            }   else {
                completion(.failure(.commonNetworkError))
                return
            }
        }
        
        task.resume()
    }
    
    func requestPost (urlString: String, completion: @escaping (Result<Data?, NetworkErrors>) -> Void) {
        guard let url = URL(string: urlString) else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.post
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
            
            if error != nil || data == nil {
                completion(.failure(.commonNetworkError))
                print("Client error!")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(.commonNetworkError))
                print("Server Error!")
                return
            }
            
            guard (200...299).contains(response.statusCode) else {
                print("Server error \(response.statusCode)!")
                return
            }
            print("Status Code: \(response.statusCode)")
            
            if let data = data {completion(.success(data))
            } else {
                completion(.failure(.commonNetworkError))
                return
            }
        })
        
        task.resume()
    }
    
}
