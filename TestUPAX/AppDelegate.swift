//
//  AppDelegate.swift
//  TestUPAX
//
//  Created by Miguel Mexicano Herrera on 23/12/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.overrideUserInterfaceStyle = .light
        
        if PersistenceManager.getEntity(type: UserData.self, key: PersistenceManagerKey.userData) != nil {
            let home = HomeRouter()
            let navigation = UINavigationController(rootViewController: home.view)
            window?.rootViewController = navigation
            window?.makeKeyAndVisible()
        } else {
            let register = RegisterRouter()
            let navigation = UINavigationController(rootViewController: register.view)
            window?.rootViewController = navigation
            window?.makeKeyAndVisible()
        }
        return true
    }

}

