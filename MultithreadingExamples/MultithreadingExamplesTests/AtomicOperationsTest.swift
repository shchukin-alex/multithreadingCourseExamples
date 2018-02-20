//
//  AtomicOperationsTest.swift
//  MultithreadingTestTests
//
//  Created by Щукин Алексей on 20/02/2018.
//  Copyright © 2018 Alexey Shchukin. All rights reserved.
//

import XCTest

class AtomicOperationsTest: XCTestCase {
    
    private var i: Int64 = 0
    private var y: UInt32 = 0
    
    func test() {
        
        OSAtomicCompareAndSwap64Barrier(i, 10, &i)
        OSAtomicAdd64Barrier(20, &i)
        OSAtomicIncrement64Barrier(&i)
        OSAtomicAnd32Barrier(1, &y)
    }
}
