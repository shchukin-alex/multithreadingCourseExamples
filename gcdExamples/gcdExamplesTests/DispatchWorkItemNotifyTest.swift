import XCTest

class DispatchWorkItemNotifyTest: XCTestCase {
    
    private let queue = DispatchQueue(label: "DispatchWorkItemTest1", attributes: .concurrent)

    func test() {
        let expect = expectation(description: "DispatchWorkItemNotify")
        
        let item = DispatchWorkItem {
            print("test")
        }
        
        item.notify(queue: DispatchQueue.main, execute: {
            print("finish")
            expect.fulfill()
        })
        queue.async(execute: item)
        
        wait(for: [expect], timeout: 10)
    }
    
}
