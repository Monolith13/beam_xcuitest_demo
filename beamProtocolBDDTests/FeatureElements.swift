//
//
//  Created by XCFit Framework
//  Copyright © 2017 XCFit Framework. All rights reserved.
//
//

import Foundation
import XCTest

enum FeatureElements {
    
    static let homeButton = XCUIApplication().buttons["Home"]
    static let searchTab = XCUIApplication().tabBars.buttons["Search"]
    static let messagesTab = XCUIApplication().tabBars.buttons["Messages"]
    static let profileTab = XCUIApplication().tabBars.buttons["Profile"]
    static let subredditsTab = XCUIApplication().tabBars.buttons["Subreddits"]
    static let searchHeader = XCUIApplication().navigationBars["beam.MainSearchView"].searchFields["Search"]
    static let messagesHeader = XCUIApplication().navigationBars["Messages"]
    static let profileHeader = XCUIApplication().navigationBars["Profile"]
    static let subredditsHeader = XCUIApplication().navigationBars["Subreddits"]
    static let multiredditsHeader = XCUIApplication().navigationBars["My Multireddits"].otherElements["My Multireddits"]
    static let multiToolbar = XCUIApplication().toolbars["Toolbar"].buttons["Multireddits"]
    static let subToolbar = XCUIApplication().toolbars["Toolbar"].buttons["Subreddits"]
    static let doneToolbar = XCUIApplication().navigationBars["Subreddits"].buttons["Done"]
    static let editToolbar = XCUIApplication().navigationBars["Subreddits"].buttons["Edit"]
    static let reorderTableButton = XCUIApplication().tables/*@START_MENU_TOKEN@*/.buttons["Reorder Frontpage, All subscriptions combined"]/*[[".cells.buttons[\"Reorder Frontpage, All subscriptions combined\"]",".buttons[\"Reorder Frontpage, All subscriptions combined\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
    
}
