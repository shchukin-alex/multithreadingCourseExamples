import XCTest

class AsyncOperationTest: XCTestCase {
    
    class AsyncOperation: Operation {
        private var finish = false
        private var execute = false
        private let queue = DispatchQueue(label: "AsyncOperation")
        
        override var isAsynchronous: Bool { return true }
        override var isFinished: Bool { return finish }
        override var isExecuting: Bool { return execute }
        
        override func start() {
            willChangeValue(forKey: "isExecuting")
            queue.async {
                self.main()
            }
            execute = true
            didChangeValue(forKey: "isExecuting")
        }
        
        override func main() {
            print("test")
            willChangeValue(forKey: "isFinished")
            willChangeValue(forKey: "isExecuting")
            
            finish = true
            execute = false
            
            didChangeValue(forKey: "isFinished")
            didChangeValue(forKey: "isExecuting")
        }
    }
    
    func test() {
        let expect = expectation(description: "AsyncOperationTest")
        
        let operation = AsyncOperation()
        operation.completionBlock = {
            expect.fulfill()
        }
        operation.start()
        
        wait(for: [expect], timeout: 10)
    }
}
