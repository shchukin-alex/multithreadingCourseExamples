import XCTest

class ThreadTest: XCTestCase {
    
    //MARK: - Test 1
    
    func test1() {
        var thread = pthread_t(bitPattern: 0)
        var attr = pthread_attr_t()
        
        pthread_attr_init(&attr)
        pthread_create(&thread, &attr, { pointer in
            
            print("test")
            return nil
        }, nil)
    }
    
    //MARK: - Test 2
    
    func test2() {
        let expect = expectation(description: "ThreadTest")
        
        let nsthread = Thread(block: {
            print("test")
            expect.fulfill()
        })
        nsthread.start()
        
        wait(for: [expect], timeout: 10)
    }
}
