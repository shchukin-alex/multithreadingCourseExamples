import XCTest

class OperationCountTest: XCTestCase {
    
    func test() {
        let expect = expectation(description: "OperationCountTest")
        expect.expectedFulfillmentCount = 3
        
        let operationQueue = OperationQueue()
        operationQueue.maxConcurrentOperationCount = 1
        operationQueue.addOperation {
            
            sleep(1)
            print("test1")
            expect.fulfill()
        }
        operationQueue.addOperation {
            
            sleep(1)
            print("test2")
            expect.fulfill()
        }
        operationQueue.addOperation {
            
            sleep(1)
            print("test3")
            expect.fulfill()
        }
        
        wait(for: [expect], timeout: 10)
    }
}
