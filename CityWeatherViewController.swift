//
//  CityWeatherViewController.swift
//  testtask
//
//  Created by Екатерина Вишневская on 20.11.2020.
//

import UIKit

class CityWeatherViewController: UIViewController {
    
    private var location = "City"
    private var weather = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        APIManager.shared.getWeather(city: location) {weather, img  in
            var locationLabel = UILabel()
            var weatherLabel = UILabel()
            var weatherIcoImageView = UIImageView()
            locationLabel = self.createLabel(text: self.location )
            weatherLabel = self.createLabel(text: weather ?? "Unknown")
            weatherIcoImageView = self.setWeatherIconView(img: img)
            
            NSLayoutConstraint.activate([
                locationLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 110),
                locationLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                locationLabel.heightAnchor.constraint(equalToConstant: 90),
                locationLabel.widthAnchor.constraint(equalToConstant: 250),
            ])
            
            self.view.addSubview(weatherLabel)
            NSLayoutConstraint.activate([
                weatherLabel.topAnchor.constraint(equalTo: locationLabel.topAnchor, constant: 110),
                weatherLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                weatherLabel.heightAnchor.constraint(equalToConstant: 90),
                weatherLabel.widthAnchor.constraint(equalToConstant: 250),
            ])
            
            
            self.view.addSubview(weatherIcoImageView)
            NSLayoutConstraint.activate([
                weatherIcoImageView.topAnchor.constraint(equalTo: weatherLabel.bottomAnchor, constant: 30),
                weatherIcoImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                weatherIcoImageView.heightAnchor.constraint(equalToConstant: 100),
                weatherIcoImageView.widthAnchor.constraint(equalToConstant: 120),
            ])
        }
    }
    
    func setCity(city: String){
        self.location = city
    }
    
    //MARK: - UI
    private func createLabel(text: String) -> UILabel {
        let label = UILabel()
        label.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.textAlignment = .center
        label.layer.borderWidth = 2
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.cornerRadius = 15
        label.layer.masksToBounds = true
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        return label
    }
    
    private func setWeatherIconView(img: UIImage?) -> UIImageView{
        let image = UIImageView()
        image.image = img
        image.layer.cornerRadius = 15
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.borderColor = UIColor.black.cgColor
        image.layer.borderWidth = 1
        return image
    }
    
}
