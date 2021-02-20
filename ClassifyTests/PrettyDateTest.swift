//
//  PrettyDateTest.swift
//  ClassifyTests
//
//  Created by Arsalan Khan on 20/02/2021.
//

import XCTest
@testable import Classify

class PrettyDateTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testYesterDayDate() throws {
        
        let date = Date().addingTimeInterval(-24 * 60 * 60)
        
        XCTAssert(date.pretty == "yesterday")
    }
    
    func testLastYear() throws {
        
        let date = Date().addingTimeInterval(-13 * 30 * (24 * 60 * 60))
        
        XCTAssert(date.pretty == "last year")
    }
    
//    func testPerformancePretty() throws {
//        
//        let date = Date().addingTimeInterval(-13 * 30 * (24 * 60 * 60))
//        
//        self.measure {
//            let _ = date.pretty
//        }
//    }


}
