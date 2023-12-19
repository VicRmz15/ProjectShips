//
//  SplashViewModel.swift
//  APIExam1
//
//  Created by Vìctor Rmz on 18/12/23.
//

import Foundation

class SplashViewModel {
    var coordinator : SplashCoordinator! //Se declara pero NO se inicializa
    
    func goToMyCustomView (info: [ModelShip]){
        coordinator.goToMyCustomView(info: info)
    }
}
