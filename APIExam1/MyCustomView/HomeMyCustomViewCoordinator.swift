//
//  HomeViewCoordinator.swift
//  APIExam1
//
//  Created by Angel Tekiani Duarte Estrada on 18/12/23.
//

import Foundation
import UIKit


class HomeViewCoordinator : Coordinator {
    var childCoordinator: [Coordinator] = []
    var navigationController : UINavigationController
    var info : [ModelShip]?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func startCoordinator() {
        var view = MyCustomViewViewController()
        var viewModel = HomeViewModel()
        viewModel.info = info
        viewModel.coordinator = self
        view.viewModel = viewModel
        navigationController.pushViewController(view, animated: true)
    }
}









