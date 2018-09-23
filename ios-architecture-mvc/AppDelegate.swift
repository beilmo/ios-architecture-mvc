//
//  AppDelegate.swift
//  ios-architecture-mvc
//
//  Created by Dorin Danciu on 11/25/17.
//  Copyright © 2017 Beilmo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.rootViewController = TopicListFlowViewController()
        return true
    }
}
