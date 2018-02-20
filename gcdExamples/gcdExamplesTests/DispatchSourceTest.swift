import XCTest

class DispatchSourceTest: XCTestCase {
    
    //MARK: - Test 1
    
    func test1() {
        let source = DispatchSource.makeTimerSource(queue: DispatchQueue.global())
        
        source.setEventHandler {
            print("test")
        }
        source.schedule(deadline: .now(), repeating: 5)
        source.activate()
        
        sleep(10)
    }
    
    //MARK: - Test 2
    
    private let source = DispatchSource.makeUserDataAddSource(queue: DispatchQueue.main)
    
    override func setUp() {
        super.setUp()
        
        source.setEventHandler {
            print(self.source.data)
        }
        source.activate()
    }
    
    func test2() {
        let expect = expectation(description: "DispatchSourceTest")
        
        DispatchQueue.global().async {
            self.source.add(data: 10)
            expect.fulfill()
        }
        
        wait(for: [expect], timeout: 10)
    }
}
