//
//  SpecificMisionViewModel.swift
//  APIExam1
//
//  Created by Vìctor Rmz on 19/12/23.
//

import Foundation

class SpecificMisionViewModel {
    var info : ModelShip?
    var coordinator : SpecificMisionCoordinator!
    
    func backToMyCustomView(){
        coordinator.backToMyCustomView()
    }
}
