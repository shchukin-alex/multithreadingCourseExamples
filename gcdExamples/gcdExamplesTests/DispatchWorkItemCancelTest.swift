
import XCTest

class DispatchWorkItemCancelTest: XCTestCase {
    
    private let queue = DispatchQueue(label: "DispatchWorkItemTest2")
    
    func test() {
        let expect = expectation(description: "DispatchWorkItemCancel")
        expect.expectedFulfillmentCount = 2
        
        queue.async {
            sleep(1)
            print("test1")
            expect.fulfill()
        }
        queue.async {
            sleep(1)
            print("test2")
            expect.fulfill()
        }
        
        let item = DispatchWorkItem {
            print("test")
        }
        queue.async(execute: item)
        
        item.cancel()
        
        wait(for: [expect], timeout: 10)
    }
}
