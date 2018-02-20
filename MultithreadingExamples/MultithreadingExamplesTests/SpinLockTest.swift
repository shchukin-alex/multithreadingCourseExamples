//
//  SpinLockTest.swift
//  MultithreadingTestTests
//
//  Created by Щукин Алексей on 20/02/2018.
//  Copyright © 2018 Alexey Shchukin. All rights reserved.
//

import XCTest

class SpinLockTest: XCTestCase {
    
    private var lock = OS_SPINLOCK_INIT
    
    func test() {
        OSSpinLockLock(&lock)
        //Do something ...
        OSSpinLockUnlock(&lock)
    }
}
