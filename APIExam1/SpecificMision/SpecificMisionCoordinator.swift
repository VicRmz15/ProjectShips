//
//  SpecificMisionCoordinator.swift
//  APIExam1
//
//  Created by Vìctor Rmz on 19/12/23.
//

import Foundation
import UIKit


class SpecificMisionCoordinator : Coordinator {
    var childCoordinator: [Coordinator] = []
    var navigationController : UINavigationController
    var info : ModelShip?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func startCoordinator() {
        var view = SpecificMisionViewController()
        var viewModel = SpecificMisionViewModel()
        viewModel.info = info
        viewModel.coordinator = self
        view.viewModel = viewModel
        navigationController.pushViewController(view, animated: true)
    }
    
    func backToMyCustomView(){
        navigationController.popViewController(animated: true)
        //navigationController.popToViewController(, animated: <#T##Bool#>) //Regresar a un viewController en especifico
        //navigationController.popToRootViewController(animated: <#T##Bool#>) //Regresar al primer viewController
        
        //let homeViewCoordinator = HomeViewCoordinator(navigationController: navigationController)
        //childCoordinator.append(homeViewCoordinator)
        //homeViewCoordinator.startCoordinator()
    }

}
