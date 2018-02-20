import XCTest

class OperationTest: XCTestCase {
    
    class OperationA: Operation {
        
        override func main() {
            print("test")
        }
    }
    
    //MARK: - Test 1
    
    func test1() {
        
        let expect = expectation(description: "OperationTest1")
        let testOperation = OperationA()
        testOperation.completionBlock = {
            expect.fulfill()
        }
        let operationQueue = OperationQueue()
        operationQueue.addOperation(testOperation)
        
        wait(for: [expect], timeout: 10)
    }
    
    //MARK: - Test 2
    
    func test2() {
        let expect = expectation(description: "OperationTest2")
        
        let operationQueue = OperationQueue()
        operationQueue.addOperation {
            print("test")
            expect.fulfill()
        }
        
        wait(for: [expect], timeout: 10)
    }
}
