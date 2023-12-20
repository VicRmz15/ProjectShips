//
//  HomeViewModel.swift
//  APIExam1
//
//  Created by Angel Tekiani Duarte Estrada on 18/12/23.
//

import Foundation

class HomeViewModel {
    var info : [ModelShip]?
    var coordinator : HomeViewCoordinator!
    
    func goToMySpecificMision (info: ModelShip){
        coordinator.goToMySpecificMision(info: info)
    }
}

