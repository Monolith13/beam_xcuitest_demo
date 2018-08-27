//
//  FeatureTabs.swift
//  beamProtocolBDDTests
//
//  Created by Vladislav Zinger on 27/08/2018.
//  Copyright © 2018 Awkward. All rights reserved.
//

import XCTest
import Foundation
import XCFit

class FeatureTabs: UITestBase, Feature {
    
    func testApp() {
        
        // Switch tabs
        whenITapSearchTab()
        thenElementShouldBeVisible(FeatureElements.searchHeader)
        whenITapMessagesTab()
        thenElementShouldBeVisible(FeatureElements.messagesHeader)
        whenITapProfileTab()
        thenElementShouldBeVisible(FeatureElements.profileHeader)
        whenITapSubredditsTab()
        thenElementShouldBeVisible(FeatureElements.subredditsHeader)
        
        // Switch tabs from toolbars
        whenITapMultiToolbar()
        thenElementShouldBeVisible(FeatureElements.multiredditsHeader)
        whenITapSubToolbar()
        thenElementShouldBeVisible(FeatureElements.subredditsHeader)
        
        // Press 'Done' and 'Edit' buttons
        whenITapEditToolbar()
        thenElementShouldBeVisible(FeatureElements.reorderTableButton)
        whenITapDoneToolbar()
        
        // Swipe subreddits screen
        let bElement = XCUIApplication().tables.children(matching: .other)["B"].children(matching: .other)["B"]
        bElement.swipeUp()
        bElement.swipeDown()
        
        // Search 'Mouse' reddit
        whenITapSearchTab()
        thenElementShouldBeVisible(FeatureElements.searchHeader)
        XCUIApplication().navigationBars["beam.MainSearchView"].searchFields["Search"].tap()
        XCUIApplication()/*@START_MENU_TOKEN@*/.keys["m"]/*[[".keyboards.keys[\"m\"]",".keys[\"m\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCUIApplication()/*@START_MENU_TOKEN@*/.keys["o"]/*[[".keyboards.keys[\"o\"]",".keys[\"o\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCUIApplication()/*@START_MENU_TOKEN@*/.keys["u"]/*[[".keyboards.keys[\"u\"]",".keys[\"u\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCUIApplication()/*@START_MENU_TOKEN@*/.keys["s"]/*[[".keyboards.keys[\"s\"]",".keys[\"s\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCUIApplication()/*@START_MENU_TOKEN@*/.keys["e"]/*[[".keyboards.keys[\"e\"]",".keys[\"e\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCUIApplication().keyboards.buttons["Search"].tap()
        thenElementShouldBeVisible(XCUIApplication().navigationBars["mouse"].otherElements["mouse"])
        XCUIApplication().navigationBars["mouse"].buttons["Back"].tap()
        
        // Open & Close Settings screen
        whenITapProfileTab()
        thenElementShouldBeVisible(FeatureElements.profileHeader)
        XCUIApplication().navigationBars["Profile"].children(matching: .button).element.tap()
        XCUIApplication().navigationBars["Settings"].children(matching: .button).element.tap()
        
        // Open & Close Auth screen
        XCUIApplication().buttons["Login to reddit"].tap()
        XCUIApplication()/*@START_MENU_TOKEN@*/.otherElements["URL"]/*[[".buttons[\"Address\"]",".otherElements[\"Address\"]",".otherElements[\"URL\"]",".buttons[\"URL\"]"],[[[-1,2],[-1,1],[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        

    }
    
}
