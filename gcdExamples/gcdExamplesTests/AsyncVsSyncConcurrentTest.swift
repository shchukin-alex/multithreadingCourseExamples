//
//  AsyncVsSyncTestConcurrent.swift
//  gcdExamplesTests
//
//  Created by Щукин Алексей on 19/02/2018.
//  Copyright © 2018 Alexey Shchukin. All rights reserved.
//

import XCTest

class AsyncVsSyncConcurrentTest: XCTestCase {
    
    private let concurrentQueue = DispatchQueue.global()
    
    func test() {
        let expect = expectation(description: "AsyncVsSyncTestConcurrent")
        expect.expectedFulfillmentCount = 4
        
        concurrentQueue.async {
            print("test1")
            expect.fulfill()
        }
        
        concurrentQueue.async {
            print("test2")
            expect.fulfill()
        }
        
        concurrentQueue.sync {
            print("test3")
            expect.fulfill()
        }
        
        concurrentQueue.sync {
            print("test4")
            expect.fulfill()
        }
        
        wait(for: [expect], timeout: 10)
    }
}
