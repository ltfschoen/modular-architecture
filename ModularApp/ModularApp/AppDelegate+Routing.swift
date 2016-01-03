//
//  AppDelegate+Routing.swift
//
//  Created by Brice Pollock on 6/13/15.
//  Copyright (c) 2015 Brice Pollock. All rights reserved.
//

import Foundation
import ModularFoundation
import ModularHomeModule
import PlainOldFeatureModule

extension AppDelegate {
    func configureRouting() {
        print("AppDelegate+Routing: Configuring Routing")
        registerModuleURLs()
        
        // Register Host App
        if let window = window {
            print("AppDelegate+Routing: Registering AppFlowController with Shared Module Router")
            let applicationFlowController = ApplicationFlowController(window: window)
            SharedModuleRouter.registerHostApp(applicationFlowController)
            appFlowController = applicationFlowController
        }
    }
    
    func registerModuleURLs() {
        print("AppDelegate+Routing: Registering Module URLs of VCs with Shared Module Router")
        SharedModuleRouter.registerModuleClass(HomeModuleViewController.self, URLPath: ModuleURL.HomeModuleURL.path)
        SharedModuleRouter.registerModuleClass(PlainOldFeatureModuleViewController.self, URLPath: ModuleURL.PlainOldFeatureModuleURL(featureUUID: "").routingPath)
    }
}

