//
//  DispatchGroup.swift
//  gcdExamplesTests
//
//  Created by Щукин Алексей on 19/02/2018.
//  Copyright © 2018 Alexey Shchukin. All rights reserved.
//

import XCTest

class DispatchGroupTest: XCTestCase {
    
    private var group: DispatchGroup!
    private var queue: DispatchQueue!
    
    override func setUp() {
        super.setUp()
        
        group = DispatchGroup()
        queue = DispatchQueue(label: "DispatchGroupTest", attributes: .concurrent)
    }
    
    //MARK: - Test 1
    
    func test1() {
        queue.async(group: group) {
            
            sleep(1)
            print("1")
        }
        queue.async(group: group) {
            
            sleep(2)
            print("2")
        }
        group.notify(queue: DispatchQueue.main) {
            print("finish all")
        }
    }
    
    //MARK: - Test 2
    
    func test2() {
        
        group.enter()
        queue.async {
            sleep(1)
            print("1")
            self.group.leave()
        }
        group.enter()
        queue.async {
            sleep(2)
            print("2")
            self.group.leave()
        }
        group.wait()
        print("finsh all")
    }
}
