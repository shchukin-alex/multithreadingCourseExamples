import XCTest

class LockTest: XCTestCase {
    
    //MARK: - Test 1
    
    private var mutex = pthread_mutex_t()
    
    func test1() {
        pthread_mutex_init(&mutex, nil)
        pthread_mutex_lock(&mutex)
        //Do something
        pthread_mutex_unlock(&mutex)
    }
    
    //MARK: - Test 2
    
    private let lock = NSLock()
    
    func test2() {
        lock.lock()
        //Do something
        lock.unlock()
    }
}
