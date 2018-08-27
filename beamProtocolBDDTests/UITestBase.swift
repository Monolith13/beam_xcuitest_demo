//
//
//  Created by XCFit Framework
//  Copyright © 2017 XCFit Framework. All rights reserved.
//

import Foundation
import XCTest
import XCFit

class UITestBase: XCFit {
    
    var app: XCUIApplication!
    
    let defaultLaunchArguments: [[String]] = {
        let launchArguments: [[String]] = [["-StartFromCleanState", "YES"]]
        guard let version = appVersion else { return launchArguments }
        return launchArguments
    }()
    
    static var appVersion: String? {
        guard let appPlist = Bundle.main.url(forResource: "Beam", withExtension: "plist"),
            let appInfo = NSDictionary(contentsOf: appPlist) else { return nil }
        return appInfo["CFBundleShortVersionString"] as? String
    }
 
    override func setUp() {
        super.setUp()
        
        app = XCUIApplication()
        app.launchArguments = ["--Reset"]
        continueAfterFailure = false
        launchApp(with: defaultLaunchArguments)
        app.buttons["Explore without account"].tap()
        
        // Press "Allow" button from alert of permission
        addUIInterruptionMonitor(withDescription: "Notification Permissions") { (alert) -> Bool in
            let button = alert.buttons["Allow"]
            if button.exists {
                button.tap()
                return true
            }
            return false
        }
        app.tap()
    }
    
    override func tearDown() {
        app.terminate()
        app = nil
        super.tearDown()
    }
    
    func launchApp(with launchArguments: [[String]] = []) {
        (defaultLaunchArguments + launchArguments).forEach { app.launchArguments += $0 }
        app.launch()
    }
    
}

extension UITestBase {
    
    func givenILaunchAppInCleanState() {
        XCTContext.runActivity(named: "Given I Launch App in Clean State") {  _ in
            launchApp(with: defaultLaunchArguments)
        }
    }
}

