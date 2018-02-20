import XCTest

class WaitOperationTest: XCTestCase {
    
    var operationQueue: OperationQueue!
    
    override func setUp() {
        super.setUp()
        operationQueue = OperationQueue()
    }
    
    //MARK: -  Test 1
    
    func test1() {
        operationQueue.addOperation {
            
            sleep(1)
            print("test1")
        }
        operationQueue.addOperation {
            
            sleep(2)
            print("test2")
        }
        operationQueue.waitUntilAllOperationsAreFinished()
    }
    
    //MARK: - Test 2
    
    func test2() {
        let operation1 = BlockOperation {
            
            sleep(1)
            print("test1")
        }
        let operation2 = BlockOperation {
            
            sleep(2)
            print("test2")
        }
        operationQueue.addOperations([operation1, operation2], waitUntilFinished: true)
    }
}
