import XCTest

class ReadWriteLockTest: XCTestCase {
    
    class Storage {
        private var lock = pthread_rwlock_t()
        private var attr = pthread_rwlockattr_t()
        
        private var test: Int = 0
        
        init() {
            pthread_rwlock_init(&lock, &attr)
        }
        
        var testProperty: Int {
            get {
                pthread_rwlock_rdlock(&lock)
                let tmp = test
                pthread_rwlock_unlock(&lock)
                return tmp
            }
            set {
                pthread_rwlock_wrlock(&lock)
                test = newValue
                pthread_rwlock_unlock(&lock)
            }
        }
    }
    
    func test() {
        let expect = expectation(description: "ReadWriteLockTest")
        expect.expectedFulfillmentCount = 4
        
        let storage = Storage()
        storage.testProperty = 10
        DispatchQueue.global().async {
            print(storage.testProperty)
            expect.fulfill()
        }
        DispatchQueue.global().async {
            print(storage.testProperty)
            expect.fulfill()
        }
        DispatchQueue.global().async {
            storage.testProperty = 100
            expect.fulfill()
        }
        DispatchQueue.global().async {
            print(storage.testProperty)
            expect.fulfill()
        }
        
        wait(for: [expect], timeout: 10)
    }
}
