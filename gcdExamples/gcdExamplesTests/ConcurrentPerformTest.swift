import XCTest

class ConcurrentPerformTest: XCTestCase {
    
    private let iterationCount = 3
    
    func test() {
        let exp = expectation(description: "ConcurrentPerform")
        exp.expectedFulfillmentCount = iterationCount
        
        DispatchQueue.concurrentPerform(iterations: iterationCount, execute: { i in
            print(i)
            exp.fulfill()
        })
        
        wait(for: [exp], timeout: 10)
    }
}
