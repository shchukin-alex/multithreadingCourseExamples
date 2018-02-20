import XCTest

class BlockOperationTest: XCTestCase {
    
    func test() {
        
        let expect = expectation(description: "BlockOperationTest")
        
        let blockOperation = BlockOperation {
            print("test")
            expect.fulfill()
        }
        let operationQueue = OperationQueue()
        operationQueue.addOperation(blockOperation)
        
        wait(for: [expect], timeout: 10)
    }
}
