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
        getData()
    }
    
    func getData(){ //Se modificará en un futuro en programación funcional.
      let networkManager = NetworkManager()
      networkManager.delegate = self
      networkManager.getSpaceList()
    }
    
    func initUI(){
        view.addSubview(imageNasaSplash)
        imageNasaSplash.addAnchorsAndCenter(centerX: true, centerY: true, width: 200, height: 200, left: nil, top: nil, right: nil, bottom: nil)
    }

}

extension SplashViewController : NetworkManagerDelegate {
    func responseSuccess(response: [ModelShip]) {
        viweModel.goToMyCustomView(info: response)
    }
    
    func responseError(error: Error) {
        let alert = UIAlertController(title : "Error", message: "Hubo un error en la recepción de información", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .destructive)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
}
