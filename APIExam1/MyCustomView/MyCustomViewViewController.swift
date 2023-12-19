//
//  MyCustomViewViewController.swift
//  APIExam1
//
//  Created by Vìctor Rmz on 30/11/23.
//

import UIKit

class MyCustomViewViewController: UIViewController {
    
    var myCustomViewModel : HomeViewModel!
    //var myCustomCoordinator : HomeViewCoordinator!
    
    var dataSource = [ModelShip]()
    
    var spaceBackground : UIImageView = {
       var spaceBackground = UIImageView()
        spaceBackground.image = UIImage(named: "Space")
        return spaceBackground
    }()
    
    var spaceShipCollection : SpaceShipCollection = {
        var spaceShipCollection = SpaceShipCollection()
        return spaceShipCollection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(spaceBackground)
        spaceBackground.addAnchorsWithMargin(0)
        initUI()
        getData()
       }
    
    func getData(){
      let networkManager = NetworkManager()
      networkManager.delegate = self
      networkManager.getSpaceList()
    }
    
    func initUI(){
        spaceShipCollection.delegate = self
        view.addSubview(spaceShipCollection)
        spaceShipCollection.addAnchors(left: 15, top: 60, right: 15, bottom: 40)
    }

}

extension MyCustomViewViewController : NetworkManagerDelegate {
    func responseSuccess(response: [ModelShip]) {
        print("responseSucess\(response)")
        dataSource.append(contentsOf: response)
        spaceShipCollection.receiveData(dataSource: dataSource)
    }
    
    func responseError(error: Error) {
        print("Error: \(error)")
    }
}
    
extension MyCustomViewViewController : SpaceShipCollectionDelegate{
        func selectedMision(indexPath: IndexPath) {
            
            let info = dataSource[indexPath.item]
            
            let specificMision = SpecificMisionViewController()
            
            specificMision.shipModelInformation = info
            specificMision.modalPresentationStyle = .fullScreen
            self.present(specificMision, animated: true)
        }
}
