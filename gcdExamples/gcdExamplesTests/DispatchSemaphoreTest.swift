//
//  DispatchSemaphoreTest.swift
//  gcdExamplesTests
//
//  Created by Щукин Алексей on 19/02/2018.
//  Copyright © 2018 Alexey Shchukin. All rights reserved.
//

import XCTest

class DispatchSemaphoreTest: XCTestCase {
    
    //MARK: - Test 1
    
    func test1() {
        let semaphore = DispatchSemaphore(value: 0)
        
        DispatchQueue.global().async {
            
            sleep(3)
            print("1")
            semaphore.signal()
        }
        semaphore.wait()
        print("2")
    }
    
    //MARK: - Test 2
    
    private let semaphore = DispatchSemaphore(value: 2)
    
    private func doWork() {
        
        semaphore.wait()
        print("test")
        sleep(3) //Do something
        semaphore.signal()
    }
    
    func test2() {
        let expect = expectation(description: "DispatchSemaphoreTest")
        expect.expectedFulfillmentCount = 3
        
        DispatchQueue.global().async {
            self.doWork()
            expect.fulfill()
        }
        DispatchQueue.global().async {
            self.doWork()
            expect.fulfill()
        }
        DispatchQueue.global().async {
            self.doWork()
            expect.fulfill()
        }
        
        wait(for: [expect], timeout: 10)
    }
}
