//
//  AppDelegate.swift
//  EasyCalculator
//
//  Created by Admin on 10.11.2019.
//  Copyright © 2019 Aleksei Kakoulin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        #if DEBUG
        if CommandLine.arguments.contains("enable-testing") {
            configureTestingState()
        }
        #endif
        
        return true
    }

    // MARK: - Private Methods

    private func configureTestingState() {
        print(configureTestingState)
    }

}
