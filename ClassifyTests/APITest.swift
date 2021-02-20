//
//  APITest.swift
//  ClassifyTests
//
//  Created by Arsalan Khan on 20/02/2021.
//

import XCTest
@testable import Classify

class APITest: XCTestCase {

    var client:  HttpClient!
    let mockSession = MockURLSession()
    
    override func setUp() {
        client = HttpClient(session: mockSession)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBaseUrl() {
                
        XCTAssertFalse(BASE_URL.isEmpty)
    }
    
    func testGetRequest() {
        
        let expectedData = "{}".data(using: .utf8)
        
        mockSession.nextData = expectedData
        
        let path = "default/dynamodb-writer"
        
        var actualData: Data?
        client.load(path: path, method: .get, params: [:]) { (data, error) in
            actualData = data as? Data
        }
        
        XCTAssertNotNil(actualData)
    }

}
