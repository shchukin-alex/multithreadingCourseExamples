import XCTest

class OperationCancelTest: XCTestCase {
    
    class OperationA: Operation {
        override func main() {
            if isCancelled {
                return
            }
            sleep(1)
            if isCancelled {
                return
            }
            print("test")
        }
    }
    
    func test() {
        let expect = expectation(description: "OperationCancelTest")
        
        let operation = OperationA()
        operation.completionBlock = {
            expect.fulfill()
        }
        let operationQueue = OperationQueue()
        operationQueue.addOperation(operation)
        operation.cancel()
        
        wait(for: [expect], timeout: 10)
    }
    
}
