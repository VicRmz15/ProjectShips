//
//  ShipCell.swift
//  APIExam1
//
//  Created by Vìctor Rmz on 30/11/23.
//

import UIKit
import SDWebImage

class ShipCell: UICollectionViewCell {
    
    var shipModelInformation : ModelShip?
    
    var squareDegraded : UIView = {
      var squareDegraded = UIView()
        squareDegraded.layer.cornerRadius = 10
        squareDegraded.clipsToBounds = true
      return squareDegraded
    }()
    
    var name: UILabel = {
        var name = UILabel()
        name.textColor = .white
        name.font = UIFont(name: "Arial Bold", size: 16)
        return name
    }()
    
    var siteName: UILabel = {
        var siteName = UILabel()
        siteName.textColor = .black
        siteName.font = UIFont(name: "Arial Bold", size: 14)
        return siteName
    }()
    
    var launchDate: UILabel = {
        var launchDate = UILabel()
        launchDate.textColor = .black
        launchDate.font = UIFont(name: "Arial Bold", size: 14)
        return launchDate
    }()
    
    var cohete : UIImageView = {
       var cohete = UIImageView()
        cohete.image = UIImage(named: "Cohete")
        return cohete
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    func initUI(shipModelInformation: ModelShip){
        self.shipModelInformation = shipModelInformation
        
        let newLayer = CAGradientLayer()
        newLayer.colors = [UIColor.black.cgColor, UIColor.white.cgColor]
        newLayer.frame = CGRect(x: 0, y: 0, width: width-15, height: 100)
        squareDegraded.layer.addSublayer(newLayer)
        
        self.addSubview(squareDegraded)
        squareDegraded.addAnchorsAndCenter(centerX: true, centerY: true, width: (width)-15, height: 100, left: nil, top: nil, right: nil, bottom: nil)
        
        cohete.sd_setImage(with: URL(string: (shipModelInformation.links?.mission_patch!)!), placeholderImage: UIImage(named: "Cohete"))
        
        squareDegraded.addSubview(cohete)
        cohete.addAnchorsAndCenter(centerX: false, centerY: true, width: 80, height: 80, left: 20, top: nil, right: nil, bottom: nil)
        
        name.text = shipModelInformation.mission_name
        squareDegraded.addSubview(name)
        name.addAnchorsAndCenter(centerX: false, centerY: false, width: 200, height: 17, left: 10, top: 10, right: nil, bottom: nil, withAnchor: .left, relativeToView: cohete)
        
        /*let flight_number1 : Int =  shipModelInformation.flight_number ?? 0
        var flight_numberString = String(flight_number1)*/
        siteName.text = shipModelInformation.launch_site?.site_name
        squareDegraded.addSubview(siteName)
        siteName.addAnchorsAndSize(width: 200, height: 15, left: 10, top: 40, right: nil, bottom: nil, withAnchor: .left, relativeToView: cohete)

        
        launchDate.text = fechaFormateada(fechaIncorrecta: shipModelInformation.launch_date_utc!)
        squareDegraded.addSubview(launchDate)
        launchDate.addAnchors(left: 10, top: 70, right: nil, bottom: nil, withAnchor: .left, relativeToView: cohete)
    }
    
    func fechaFormateada(fechaIncorrecta : String ) -> String{
        let dateFormatterEntrada = DateFormatter()
        dateFormatterEntrada.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        
        if let fecha = dateFormatterEntrada.date(from: fechaIncorrecta){
            //var launchDateNew : String = shipModelInformation?.launch_date_utc ?? "No hay fecha"
            var newDate = DateFormatter()
            newDate.dateFormat = "EEEE, MMM d, yyyy"
            let fechaFormateada = newDate.string(from: fecha)
            
            print("\(fechaFormateada)")
            return fechaFormateada
        }else {
            print("Error: No se pudo convertir la fecha")
        }
        return "Hola"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
