//
//
//  Created by XCFit Framework
//  Copyright © 2017 XCFit Framework. All rights reserved.
//
//

import Foundation
import XCTest
import XCFit

extension Feature {
    
    func whenIswipeLeft() {
        XCTContext.runActivity(named: "When I Swipe Left") { _ in
            XCUIApplication().swipeLeft()
        }
    }
    
    func whenITapHomeButton() {
        XCTContext.runActivity(named: "When I Tap Home Button") { _ in
            FeatureScreen.homeButton.tap()
        }
    }
    
    func whenITapSearchTab() {
        XCTContext.runActivity(named: "When I Tap Search tab") { _ in
            FeatureScreen.searchTab.tap()
        }
    }
    
    func whenITapMessagesTab() {
        XCTContext.runActivity(named: "When I Tap Messages tab") { _ in
            FeatureScreen.messagesTab.tap()
        }
    }
    
    func whenITapProfileTab() {
        XCTContext.runActivity(named: "When I Tap Profile tab") { _ in
            FeatureScreen.profileTab.tap()
        }
    }
    
    func whenITapSubredditsTab() {
        XCTContext.runActivity(named: "When I Tap Subreddits tab") { _ in
            FeatureScreen.subredditsTab.tap()
        }
    }
}
