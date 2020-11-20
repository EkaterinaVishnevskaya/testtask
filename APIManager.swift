//
//  APIManager.swift
//  testtask
//
//  Created by Екатерина Вишневская on 20.11.2020.
//

import UIKit

class APIManager {
    
    private enum Constants {
        static let APIKey = "e5a1eaa00c39683f66be0e60ca0a06f7"
    }
    static let shared = APIManager()
    
    func getWeather(city: String, completion: ((String?, UIImage?) -> Void)?) {
        let url = "http://api.weatherstack.com/current?access_key =\(Constants.APIKey)& query = \(city)"
        NetworkManager.networkManager.requestPost(urlString: url) { result in
            switch result {
            case .success(let data):
                guard let data = data else {
                    return
                }
                do{
                    let jsonResult = try JSONDecoder().decode(Weather.self, from: data)
                    let weather = "\(jsonResult.current.temperature)°"
                    var image = UIImage()
                    guard let url = try URL(string: jsonResult.current.weatherIcons[0]) else {
                        return
                    }
                    DispatchQueue.global().async {
                        guard let imageData = try? Data(contentsOf: url) else { return }

                        let img = UIImage(data: imageData)
                        DispatchQueue.main.async {
                            image = img ?? UIImage()
                        }
                    }
                    completion?(weather, image)
                } catch {
                    print ("JSON Error")
                    completion?(nil, nil)
                }
            case .failure:
                print ("Network Error")
                completion?(nil, nil)
            }
        }
    }
}
