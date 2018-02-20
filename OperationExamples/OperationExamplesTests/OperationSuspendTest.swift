import XCTest

class OperationSuspendTest: XCTestCase {
    
    func test() {
        let expect = expectation(description: "OperationSuspendTest")
        
        let operation1 = BlockOperation {
            sleep(1)
            print("test1")
            expect.fulfill()
        }
        
        let operation2 = BlockOperation {
            sleep(1)
            print("test2")
        }
        
        let operationQueue = OperationQueue()
        operationQueue.maxConcurrentOperationCount = 1
        operationQueue.addOperation(operation1)
        operationQueue.addOperation(operation2)
        
        operationQueue.isSuspended = true
        
        wait(for: [expect], timeout: 10)
    }
}
