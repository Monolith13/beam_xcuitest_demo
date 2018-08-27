//
//
//  Created by XCFit Framework
//  Copyright © 2017 XCFit Framework. All rights reserved.
//
//

import Foundation
import XCTest

enum FeatureScreen {
    
    static let homeButton = XCUIApplication().buttons["Home"]
    static let searchTab = XCUIApplication().tabBars.buttons["Search"]
    static let messagesTab = XCUIApplication().tabBars.buttons["Messages"]
    static let profileTab = XCUIApplication().tabBars.buttons["Profile"]
    static let subredditsTab = XCUIApplication().tabBars.buttons["Subreddits"]
    
}
