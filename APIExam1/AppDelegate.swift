//
//  AppDelegate.swift
//  APIExam1
//
//  Created by Vìctor Rmz on 29/11/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator : AppCoordinator?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        self.appCoordinator = AppCoordinator(window: window!)
        appCoordinator?.startCoordinator()
        
        return true
    }
}

/*
 3 maneras de manejar dependencias de terceros (Frameworks, APIs, etc)
 
 - Cocoapods
 - Carthage
 - SPM Swift Package Manager
 
 
 
 
 */
