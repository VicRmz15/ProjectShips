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
        nameShip.font = UIFont(name: "Arial Bold", size: 30)
        nameShip.textColor = .white
        nameShip.textAlignment = .center
        return nameShip
    }()
    
    var detail : UILabel = {
       var detail = UILabel()
        detail.font = UIFont(name: "Arial Bold", size: 30)
        detail.textColor = .systemBlue
        return detail
    }()
    
    var dateLaunch : UILabel = {
       var dateLaunch = UILabel()
        dateLaunch.font = UIFont(name: "Arial", size: 20)
        dateLaunch.textColor = .systemMint
        return dateLaunch
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
        nameShip.addAnchorsAndCenter(centerX: true, centerY: false, width: 200, height: 30, left: nil, top: 70, right: nil, bottom: nil)
        
        detail.text = "Detalles"
        view.addSubview(detail)
        detail.addAnchorsAndSize(width: 200, height: 30, left: 20, top: 40, right: nil, bottom: nil, withAnchor: .top, relativeToView: buttonBack)
        
        dateLaunch.text = shipModelInformation?.last_ll_update
        view.addSubview(dateLaunch)
        dateLaunch.addAnchorsAndSize(width: 200, height: 20, left: 20, top: 10, right: nil, bottom: nil, withAnchor: .top, relativeToView: detail)
        
    }
    
    @objc func backView(){
        dismiss(animated: true)
    }
}
