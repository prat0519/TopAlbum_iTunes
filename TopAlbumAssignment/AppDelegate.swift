//
//  AppDelegate.swift
//  TopAlbumAssignment
//
//  Created by Pandey, Prashant A (CORP) on 3/15/20.
//  Copyright © 2020 Prashant Pandey. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let masterViewController = AlbumListViewController()
        let navigationController = UINavigationController(rootViewController: masterViewController)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        
        return true
    }

}

