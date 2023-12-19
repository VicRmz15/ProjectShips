//
//  SplashCoordinator.swift
//  APIExam1
//
//  Created by Vìctor Rmz on 18/12/23.
//

import Foundation
import UIKit

class SplashCoordinator : Coordinator{
    var childCoordinator: [Coordinator] = []
    var navigationController : UINavigationController
    
    init(navigationController : UINavigationController){
        self.navigationController = navigationController
    }
    
    func startCoordinator() {
        let view = SplashViewController()
        let viewModel = SplashViewModel()
        viewModel.coordinator = self
        view.viweModel = viewModel
        navigationController.setViewControllers([view], animated: true)
        navigationController.setNavigationBarHidden(true, animated: true)
    }
    
    func goToMyCustomView(info: [ModelShip]) {
        let homeMyCustomCordinator = HomeViewCoordinator(navigationController: navigationController)
        homeMyCustomCordinator.info = info
        childCoordinator.append(homeMyCustomCordinator)
        homeMyCustomCordinator.startCoordinator()
        
    }
    
}

