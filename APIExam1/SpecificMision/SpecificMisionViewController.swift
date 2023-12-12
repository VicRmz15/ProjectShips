//
//  SpecificMisionViewController.swift
//  APIExam1
//
//  Created by Vìctor Rmz on 03/12/23.
//

import UIKit

class SpecificMisionViewController: UIViewController {
    
    var shipModelInformation : ModelShip?
    
    var imageBackgroundSpecefic : UIImageView = {
        var imageBackground = UIImageView()
        imageBackground.image = UIImage(named: "Launch")
        return imageBackground
    }()
    
    var buttonBack : UIButton = {
        var buttonBack = UIButton()
        buttonBack.setImage(UIImage(named: "Back"), for: .normal)
        buttonBack.tintColor = .white
        return buttonBack
    }()
    
    var nameShip : UILabel = {
        var nameShip = UILabel()
        nameShip.font = UIFont(name: "Serif", size: 20)
        nameShip.textColor = .systemGreen
        nameShip.textAlignment = .center
        return nameShip
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        initUI()
    }
    
    func initUI(){
        
        view.addSubview(imageBackgroundSpecefic)
        imageBackgroundSpecefic.addAnchorsWithMargin(0)
        
        buttonBack.addTarget(self, action: #selector(backView), for: .touchUpInside)
        view.addSubview(buttonBack)
        buttonBack.addAnchorsAndSize(width: 40, height: 40, left: 10, top: 60, right: nil, bottom: nil)
        
        nameShip.backgroundColor = .clear
        nameShip.text = shipModelInformation?.mission_name
        view.addSubview(nameShip)
        nameShip.addAnchorsAndCenter(centerX: true, centerY: false, width: 200, height: 25, left: nil, top: 100, right: nil, bottom: nil)
        
    }
    
    @objc func backView(){
        dismiss(animated: true)
    }
}
