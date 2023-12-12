//
//  NetworkManager.swift
//  APIExam1
//
//  Created by Vìctor Rmz on 30/11/23.
//

import Foundation
protocol NetworkManagerDelegate{
  func responseSuccess(response : [ModelShip])
  func responseError(error : Error)
}

class NetworkManager : NSObject, URLSessionDelegate, URLSessionDataDelegate{
  var delegate : NetworkManagerDelegate?
  /*
   Peticion -> Request
   -> URL - La cual es la direccion a la cual vamos a hacer nuestra peticion
   ->Mettod - GET, POST, PUT, DELETE dependiendo la operacion que vamos a hacer es el metodo que vamos a utilizar
   GET -> es una metodo en el que no enviamos parametros para recibir una respuesta
   */
  
  /*
   Consumos nativos
   ->URLSession
   
   */
  
  func  getSpaceList(){//get por el tipo de metodo
    let urlString = "https://api.spacexdata.com/v3/launches/past" // url en string
    let url = URL(string: urlString)! //Creamos nuestro objeto de tipo URL
    //crear la sesion que es el lugar donde vamos a pedir algo y vamos a recibir algo
    let sessionConfiguration = URLSessionConfiguration.default //Creamos la configuracion de nuestro session
    let defaultSession = URLSession(configuration: sessionConfiguration, delegate: self, delegateQueue: OperationQueue.main) //creamos nuestro session con la configuracion default, nos respondera AQUI con delegate(self), y usaremos el operationMain, sea asincrono
    
    //donde vamos a hacer nuestra peticion y lo
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.timeoutInterval = 20 //cuanto tiempo vamos a esperar a que nos responda
    
    //unificar el proceso y hacer nuestra peticion con nuestra sesion
    let task = defaultSession.dataTask(with: request){[self]data, response, error in //creamos nuestros task para hacer el consumo y tener las respuestas, data es loq eu vamos a recibir, el response los parametros de la pagina que se pidio, error es el error
      
      //validamos que existe el error o que no existe
      if let error = error{
    
        delegate?.responseError(error: error)
      }else{
        if let data = data{
          //let json = String(data: data, encoding: .utf8)
         //aqui hacemos el parceo el cambio de datos tipo data a un arreglo de persona como en este caso, el do es el que lo intenta, si no pues en el catch nos muestra el error
          do{
            let shipObject = try JSONDecoder().decode([ModelShip].self, from: data)
            delegate?.responseSuccess(response: shipObject)
          }catch{
            print(error.localizedDescription)
            delegate?.responseError(error: error)
          }
        }
      }
      
    }
    task.resume()//aqui cerramos nuestro task
  }
}
