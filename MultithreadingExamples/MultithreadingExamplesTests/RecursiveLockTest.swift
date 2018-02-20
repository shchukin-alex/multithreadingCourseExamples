import XCTest

class RecursiveLockTest: XCTestCase {
    
    //MARK: -  Test 1
    
    private var mutex = pthread_mutex_t()
    private var attr = pthread_mutexattr_t()
    
    func test1() {
        pthread_mutexattr_init(&attr)
        pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE)
        pthread_mutex_init(&mutex, &attr)
        
        pthread_mutex_lock(&mutex)
        justMethod1()
        pthread_mutex_unlock(&mutex)
    }
    
    func justMethod1() {
        pthread_mutex_lock(&mutex)
        //Do something
        pthread_mutex_unlock(&mutex)
    }
    
    
    //MARK: - Test 2
    
    private let lock = NSRecursiveLock()
    
    func test2() {
        lock.lock()
        justMethod2()
        lock.unlock()
    }
    
    func justMethod2() {
        lock.lock()
        //Do something
        lock.unlock()
    }
}
