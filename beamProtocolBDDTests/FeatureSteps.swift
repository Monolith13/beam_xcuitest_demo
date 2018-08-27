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
    
    func givenTheAppIsLaunched() {
        XCUIApplication().launch()
    }

    
    func whenIswipeLeft() {
        XCTContext.runActivity(named: "When I Swipe Left") { _ in
            XCUIApplication().swipeLeft()
        }
    }
    
    func whenITapHomeButton() {
        XCTContext.runActivity(named: "When I Tap 'Home' Button") { _ in
            FeatureElements.homeButton.tap()
        }
    }
    
    func whenITapSearchTab() {
        XCTContext.runActivity(named: "When I tap 'Search' tab") { _ in
            FeatureElements.searchTab.tap()
        }
    }
    
    func whenITapMessagesTab() {
        XCTContext.runActivity(named: "When I tap 'Messages' tab") { _ in
            FeatureElements.messagesTab.tap()
        }
    }
    
    func whenITapProfileTab() {
        XCTContext.runActivity(named: "When I tap 'Profile' tab") { _ in
            FeatureElements.profileTab.tap()
        }
    }
    
    func whenITapSubredditsTab() {
        XCTContext.runActivity(named: "When I tap 'Subreddits' tab") { _ in
            FeatureElements.subredditsTab.tap()
        }
    }
    
    func whenITapMultiToolbar() {
        XCTContext.runActivity(named: "When I tap 'Multireddits' from toolbar") { _ in
            FeatureElements.multiToolbar.tap()
        }
    }
    
    func whenITapSubToolbar() {
        XCTContext.runActivity(named: "When I tap 'Subreddits' from  toolbar") { _ in
            FeatureElements.subToolbar.tap()
        }
    }
    
    func whenITapDoneToolbar() {
        XCTContext.runActivity(named: "When I tap 'Done' button from navigationBar") { _ in
            FeatureElements.doneToolbar.tap()
        }
    }
    
    func whenITapEditToolbar() {
        XCTContext.runActivity(named: "When I tap 'Edit' button from navigationBar") { _ in
            FeatureElements.editToolbar.tap()
        }
    }

}
