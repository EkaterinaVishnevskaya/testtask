//
//  Router.swift
//  testtask
//
//  Created by Екатерина Вишневская on 20.11.2020.
//

import UIKit

protocol RoutingLogic {
    func navigateToDetailsViewController(city:String)
}

class Router: RoutingLogic {
    weak var viewController: UIViewController?
    
    func navigateToDetailsViewController(city:String) {
        let VC = CityWeatherViewController()
        VC.setCity(city: city)
        viewController?.navigationController?.pushViewController(VC, animated: true)
    }
}
