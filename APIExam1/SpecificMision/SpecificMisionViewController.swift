//
//  SpecificMisionViewController.swift
//  APIExam1
//
//  Created by Vìctor Rmz on 03/12/23.
//

import UIKit

class SpecificMisionViewController: UIViewController {
    
    var viewModel : SpecificMisionViewModel!
    
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
        dateLaunch.font = UIFont(name: "Arial Bold", size: 20)
        dateLaunch.textColor = .systemYellow
        return dateLaunch
    }()
    
    var siteLaunch : UILabel = {
       var siteLaunch = UILabel()
        siteLaunch.font = UIFont(name: "Arial Bold", size: 20)
        siteLaunch.textColor = .systemYellow
        return siteLaunch
    }()
    
    var rocketName : UILabel = {
       var rocketName = UILabel()
        rocketName.font = UIFont(name: "Arial Bold", size: 20)
        rocketName.textColor = .systemYellow
        return rocketName
    }()
    
    var rocketType : UILabel = {
       var rocketType = UILabel()
        rocketType.font = UIFont(name: "Arial Bold", size: 20)
        rocketType.textColor = .systemYellow
        return rocketType
    }()
    
    var descriptionMision : UITextView = {
       var descriptionMision = UITextView()
        descriptionMision.font = UIFont(name: "Arial", size: 13)
        descriptionMision.textColor = .systemYellow
        descriptionMision.backgroundColor = .white
        return descriptionMision
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        initInfo()
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
        
        dateLaunch.text = "Date: \(fechaFormateada(fechaIncorrecta: (shipModelInformation?.launch_date_utc)!))"
        view.addSubview(dateLaunch)
        dateLaunch.addAnchorsAndSize(width: 400, height: 20, left: 22, top: 10, right: nil, bottom: nil, withAnchor: .top, relativeToView: detail)
        
        siteLaunch.text = "Site: \((shipModelInformation?.launch_site?.site_name_long)!)"
        view.addSubview(siteLaunch)
        siteLaunch.addAnchorsAndSize(width: 400, height: 20, left: 22, top: 10, right: nil, bottom: nil, withAnchor: .top, relativeToView: dateLaunch)
        
        rocketName.text = "Rocket name: \((shipModelInformation?.rocket?.rocket_name)!)"
        view.addSubview(rocketName)
        rocketName.addAnchorsAndSize(width: 400, height: 20, left: 22, top: 10, right: nil, bottom: nil, withAnchor: .top, relativeToView: siteLaunch)
        
        rocketType.text = "Rocket name: \((shipModelInformation?.rocket?.rocket_type)!)"
        view.addSubview(rocketType)
        rocketType.addAnchorsAndSize(width: 400, height: 20, left: 22, top: 10, right: nil, bottom: nil, withAnchor: .top, relativeToView: rocketName)
        
        descriptionMision.text = shipModelInformation?.details
        view.addSubview(descriptionMision)
        descriptionMision.addAnchorsAndSize(width: width-20, height: 250, left: 10, top: 30, right: nil, bottom: nil, withAnchor: .top, relativeToView: rocketType)
        
        
        
    }
    
    func fechaFormateada(fechaIncorrecta : String ) -> String{
        let dateFormatterEntrada = DateFormatter()
        dateFormatterEntrada.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        
        if let fecha = dateFormatterEntrada.date(from: fechaIncorrecta){
            //var launchDateNew : String = shipModelInformation?.launch_date_utc ?? "No hay fecha"
            let newDate = DateFormatter()
            newDate.dateFormat = "MMM d, h:mm a"
            newDate.locale = Locale(identifier: "en_US")
            let fechaFormateada = newDate.string(from: fecha)
            
            print("\(fechaFormateada)")
            return fechaFormateada
        }else {
            print("Error: No se pudo convertir la fecha")
        }
        return "Hola"
    }
    
    func initInfo(){
        shipModelInformation = viewModel.info
    }
    
    @objc func backView(){
        //dismiss(animated: true)
        viewModel.backToMyCustomView()
    }
}
