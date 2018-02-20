import XCTest

class TargetQueueHierarchyTest: XCTestCase {
    
    func test() {
        let expect = expectation(description: "TargetQueueHierarchyTest")
        expect.expectedFulfillmentCount = 2
        
        let targetQueue = DispatchQueue(label: "TargetQueue")
        let queue1 = DispatchQueue(label: "Queue1", target: targetQueue)
        let dispatchSource1 = DispatchSource.makeTimerSource(queue: queue1)
        dispatchSource1.setEventHandler {
            print("test1")
            expect.fulfill()
        }
        dispatchSource1.schedule(deadline: .now() + 1)
        dispatchSource1.activate()
        
        let queue2 = DispatchQueue(label: "Queue2", target: targetQueue)
        let dispatchSource2 = DispatchSource.makeTimerSource(queue: queue2)
        dispatchSource2.setEventHandler {
            print("test2")
            expect.fulfill()
        }
        dispatchSource2.schedule(deadline: .now() + 2)
        dispatchSource2.activate()
        
        wait(for: [expect], timeout: 10)
    }
}
