//
//  CacheTest.swift
//  ClassifyTests
//
//  Created by Arsalan Khan on 20/02/2021.
//

import XCTest
@testable import Classify

class CacheTest: XCTestCase {

    var urlRequest: URLRequest!
    let testData: Data = "test".data(using: .utf8)!
    
    var wrappedCache: MyCacheWrapper!
    
    override func setUpWithError() throws {
        
        wrappedCache = MyCacheWrapper()
        
        urlRequest = URLRequest(baseUrl: BASE_URL, path: "default/dynamodb-writer", method: .get, params: [:])
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCacheEmptyFetch() throws {
                
        wrappedCache.cache.removeAllCachedResponses()
        
        let cacheResponse = wrappedCache.cache.cachedResponse(for: urlRequest)

        XCTAssertNil(cacheResponse)
    }
    
    func testCacheSaveOperation() throws {
    
        print("testCacheSaveOperation")
        
        wrappedCache.cache.storeCachedResponse(CachedURLResponse(response: URLResponse(), data: testData), for: urlRequest)
        
        XCTAssertNotNil(wrappedCache.cache.cachedResponse(for: urlRequest))
    }
    
    func testCacheRemove() throws {
        
        wrappedCache.cache.removeCachedResponse(for: urlRequest)
        
        let cacheResponse = wrappedCache.cache.cachedResponse(for: urlRequest)
        
        XCTAssertNil(cacheResponse)
    }
    

}
