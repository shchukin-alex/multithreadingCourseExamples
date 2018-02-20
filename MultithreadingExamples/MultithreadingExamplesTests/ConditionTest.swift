//
//  ConditionTest.swift
//  MultithreadingTestTests
//
//  Created by Щукин Алексей on 20/02/2018.
//  Copyright © 2018 Alexey Shchukin. All rights reserved.
//

import XCTest

class ConditionTest: XCTestCase {
    
    //MARK: - Test 1

    private var condition1 = pthread_cond_t()
    private var mutex = pthread_mutex_t()
    private var check1 = false
    var expect: XCTestExpectation!
    
    func test1() {
        expect = expectation(description: "ConditionTest")
        pthread_cond_init(&condition1, nil)
        pthread_mutex_init(&mutex, nil)
        
        DispatchQueue.global().async { [weak self] in
            self?.justMethod1()
        }
        
        pthread_mutex_lock(&mutex)
        check1 = true
        pthread_cond_signal(&condition1)
        pthread_mutex_unlock(&mutex)
        wait(for: [expect], timeout: 10)
    }
    
    func justMethod1() {
        pthread_mutex_lock(&mutex)
        while !check1 {
            pthread_cond_wait(&condition1, &mutex)
        }
        //Do something
        pthread_mutex_unlock(&mutex)
        expect.fulfill()
    }
    
    //MARK: - Test 2
    
    private let condition2 = NSCondition()
    private var check2: Bool = false
    
    func justMethod2() {
        condition2.lock()
        while(!check2) {
            condition2.wait()
        }
        condition2.unlock()
        expect.fulfill()
    }
    
    func test2() {
        expect = expectation(description: "ConditionTest")
        
        DispatchQueue.global().async { [weak self] in
            self?.justMethod2()
        }
        
        condition2.lock()
        
        check2 = true
        condition2.signal()
        condition2.unlock()
        
        wait(for: [expect], timeout: 10)
    }
}
