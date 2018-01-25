//
//  AppDelegate.swift
//  Singapore PSI
//
//  Created by Zhang Tianli on 22/1/18.
//  Copyright © 2018 tianli. All rights reserved.
//

import UIKit
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        GMSServices.provideAPIKey(ApiUtils.gmsApiKey)
        // Override point for customization after application launch.
        return true
    }

}

