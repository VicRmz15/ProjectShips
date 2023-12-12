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

        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            // Override point for customization after application launch.
            window = UIWindow(frame: UIScreen.main.bounds)
            let navigationController = UINavigationController(rootViewController: MyCustomViewViewController())
            window?.rootViewController = navigationController
            window?.makeKeyAndVisible()
            
            
            return true
        }

}

/*
 3 maneras de manejar dependencias de terceros (Frameworks, APIs, etc)
 
 - Cocoapods
 - Carthage
 - SPM Swift Package Manager
 
 
 
 
 */
