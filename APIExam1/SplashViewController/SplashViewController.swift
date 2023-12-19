//
//  SplashViewController.swift
//  APIExam1
//
//  Created by Vìctor Rmz on 18/12/23.
//

import UIKit

class SplashViewController: UIViewController {
    
    var viweModel : SplashViewModel! //AQUI SE DECLARA, "NO" SE INICIALIZA.
    
    var imageNasaSplash : UIImageView = {
       var image = UIImageView()
        image.image = UIImage(named: "Nasa")
        image.contentMode = .scaleAspectFit
        return image
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initUI()
        setupTimer()
    }
    
    func initUI(){
        view.addSubview(imageNasaSplash)
        imageNasaSplash.addAnchorsAndCenter(centerX: true, centerY: true, width: 200, height: 200, left: nil, top: nil, right: nil, bottom: nil)
    }
    
    func setupTimer(){
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(goToMyCustomView), userInfo: nil, repeats: false)
    }
    
     @objc func goToMyCustomView (){
         viweModel.goToMyCustomView()
    }

}
