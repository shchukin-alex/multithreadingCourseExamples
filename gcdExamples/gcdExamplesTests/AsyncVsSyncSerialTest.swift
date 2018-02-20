//
//  AsyncVsSyncTest1.swift
//  gcdExamplesTests
//
//  Created by Щукин Алексей on 19/02/2018.
//  Copyright © 2018 Alexey Shchukin. All rights reserved.
//

import XCTest

class AsyncVsSyncSerialTest: XCTestCase {
    
    private let serialQueue = DispatchQueue(label: "serialTest")
    
    func test() {
        let expect = expectation(description: "AsyncVsSyncTestSerial")
        expect.expectedFulfillmentCount = 4
        
        serialQueue.async {
            print("test1")
            expect.fulfill()
        }
        
        serialQueue.async {
            sleep(1)
            print("test2")
            expect.fulfill()
        }
        
        serialQueue.sync {
            print("test3")
            expect.fulfill()
        }
        
        serialQueue.sync {
            print("test4")
            expect.fulfill()
        }
        
        wait(for: [expect], timeout: 10)
    }
}
