//
//  hide_chanTests.swift
//  hide_chanTests
//
//  Created by bookair17 on 10/25/17.
//  Copyright © 2017 routeflags. All rights reserved.
//

import XCTest
import UIKit
import AVKit
import AVFoundation
@testable import hide_chan

class hide_chanTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
	
    func testLabelTitle() {
		let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
		let viewController = storyBoard.instantiateViewController(withIdentifier: "viewController") as? ViewController
		viewController?.viewDidLoad()
//		XCTAssertEqual(viewController?.label?.text, "Hello, World.")
	}
}
