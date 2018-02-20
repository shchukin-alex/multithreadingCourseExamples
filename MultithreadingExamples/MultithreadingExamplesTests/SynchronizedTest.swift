import XCTest

class SynchronizedTest: XCTestCase {
    
    private let lock = NSObject()
    
    func test() {
        objc_sync_enter(lock)
        //Do something...
        objc_sync_exit(lock)
    }
    
}
