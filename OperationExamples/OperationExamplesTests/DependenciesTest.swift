import XCTest

class DependenciesTest: XCTestCase {
    
    func test() {
        let expect = expectation(description: "DependenciesTest")
        expect.expectedFulfillmentCount = 2
        
        let operation1 = BlockOperation {
            print("test1")
            expect.fulfill()
        }
        let operation2 = BlockOperation {
            print("test2")
            expect.fulfill()
        }
        operation2.addDependency(operation1)
        
        let operationQueue = OperationQueue()
        operationQueue.addOperation(operation1)
        operationQueue.addOperation(operation2)
        
        wait(for: [expect], timeout: 10)
    }
}
