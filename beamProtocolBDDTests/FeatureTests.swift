//
//
//  Created by XCFit Framework
//  Copyright © 2017 XCFit Framework. All rights reserved.
//


import XCTest
import XCFit

class FeatureTests: UITestBase, Feature {
    
    func testAppIsRunning() {
        givenILaunchAppInCleanState()
        whenITapSearchTab()
        whenITapMessagesTab()
        whenITapProfileTab()
        whenITapSubredditsTab()
        
    }
}
