import XCTest

class StorageTest {
    
    private let queue = DispatchQueue(label: "DispatchBarrierTest", attributes: .concurrent)
    
    private var internalTest: Int = 0
    
    func setTest(_ test: Int) {
        
        queue.async(flags: .barrier) {
            self.internalTest = test
        }
    }
    
    func test() -> Int{
        
        var tmp: Int = 0
        queue.sync {
            tmp = self.internalTest
        }
        return tmp
    }
}

class DispatchBarrierTest: XCTestCase {
    
    func test() {
        let expect = expectation(description: "DispatchBarrierTest")
        expect.expectedFulfillmentCount = 4
        
        let storage = StorageTest()
        storage.setTest(10)
        
        DispatchQueue.global().async {
            print(storage.test())
            expect.fulfill()
        }
        
        DispatchQueue.global().async {
            print(storage.test())
            expect.fulfill()
        }
        
        DispatchQueue.global().async {
            storage.setTest(100)
            expect.fulfill()
        }
        
        DispatchQueue.global().async {
            print(storage.test())
            expect.fulfill()
        }
        
        wait(for: [expect], timeout: 10)
    }
}
