//
//  SpaceShipCollection.swift
//  APIExam1
//
//  Created by Vìctor Rmz on 30/11/23.
//
import Foundation
import UIKit

protocol SpaceShipCollectionDelegate{
  func selectedMision(indexPath : IndexPath)
}

class SpaceShipCollection: UIView {
    
    var delegate : SpaceShipCollectionDelegate?
    
    var dataSource = [ModelShip]()

    var collectionViewShip : UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        var collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        return collection
    }()

    init(){
        super.init(frame: .zero)
        initUI()
    }
    
    func initUI(){
        collectionViewShip.delegate = self // Paso 6
        collectionViewShip.dataSource = self // Paso 6
        collectionViewShip.register(ShipCell.self, forCellWithReuseIdentifier: "cell") // Paso 5
        self.addSubview(collectionViewShip) // Paso 7
        collectionViewShip.addAnchorsWithMargin(0)
    }
    
    func receiveData(dataSource: [ModelShip]){
        self.dataSource = dataSource
        collectionViewShip.reloadData()
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SpaceShipCollection : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ShipCell
        
        let info = dataSource[indexPath.item]
        
        cell.initUI(shipModelInformation : info)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (width)-15, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.selectedMision(indexPath: indexPath)
        
        //collectionView.reloadData()
        
    }
}
