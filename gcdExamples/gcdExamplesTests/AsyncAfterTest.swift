//
//  AsyncAfter.swift
//  gcdExamplesTests
//
//  Created by Щукин Алексей on 19/02/2018.
//  Copyright © 2018 Alexey Shchukin. All rights reserved.
//

import XCTest

class AsyncAfterTest: XCTestCase {
    
    private let concurrentQueue = DispatchQueue(label: "AsyncAfterTest", attributes: .concurrent)
    
    func test() {
        
        func test() {
            let expect = expectation(description: "AsyncAfter")
            
            concurrentQueue.asyncAfter(deadline: .now() + 3, execute: {
                print("test")
            })
            
            wait(for: [expect], timeout: 10)
        }
    }
}
