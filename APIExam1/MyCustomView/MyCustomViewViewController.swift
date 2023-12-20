//
//  MyCustomViewViewController.swift
//  APIExam1
//
//  Created by Vìctor Rmz on 30/11/23.
//

import UIKit

class MyCustomViewViewController: UIViewController {
    
    var viewModel : HomeViewModel!
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
        initInfo()
        initUI()
       }
    
    func initUI(){
        spaceShipCollection.receiveData(dataSource: dataSource)
        spaceShipCollection.delegate = self
        view.addSubview(spaceShipCollection)
        spaceShipCollection.addAnchors(left: 15, top: 60, right: 15, bottom: 40)
    }
    
    func initInfo (){
        dataSource = viewModel.info!
    }

}
    
extension MyCustomViewViewController : SpaceShipCollectionDelegate{
        func selectedMision(indexPath: IndexPath) {
            
            let info = dataSource[indexPath.item]
            viewModel.goToMySpecificMision(info: info)
            //let specificMision = SpecificMisionViewController()
            //specificMision.shipModelInformation = info
            //specificMision.modalPresentationStyle = .fullScreen
            //self.present(specificMision, animated: true)
        }
}
