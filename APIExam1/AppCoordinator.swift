//
//  AppCoordinator.swift
//  APIExam1
//
//  Created by Vìctor Rmz on 18/12/23.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinator : [Coordinator] { get set }
    func startCoordinator()
    
}

class AppCoordinator : Coordinator {
    var childCoordinator: [Coordinator] = []
    var window : UIWindow
    
    init(window : UIWindow){
        self.window = window
    }
    
    func startCoordinator() {
        var navigationCotroller = UINavigationController()
        let splashCoordinator = SplashCoordinator(navigationController: navigationCotroller)
        childCoordinator.append(splashCoordinator)
        splashCoordinator.startCoordinator()
        
        window.rootViewController = navigationCotroller
        window.makeKeyAndVisible()
    }
    
    
}
