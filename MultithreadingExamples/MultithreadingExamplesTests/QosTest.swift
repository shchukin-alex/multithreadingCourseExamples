import XCTest

class QosTest: XCTestCase {
    
    //MARK: - Test 1
    
    func test1() {
        var thread = pthread_t(bitPattern: 0)
        var attribute = pthread_attr_t()
        pthread_attr_init(&attribute)
        pthread_attr_set_qos_class_np(&attribute, QOS_CLASS_USER_INITIATED, 0)
        pthread_create(&thread, &attribute, { poiner in
            
            print("test")
            pthread_set_qos_class_self_np(QOS_CLASS_BACKGROUND, 0)
            
            return nil
        }, nil)
    }
    
    //MARK: - Test 2
    
    func test2() {
        let expect = expectation(description: "QosTest")
        
        let thread = Thread {
            
            print("test")
            print(qos_class_self())
            expect.fulfill()
        }
        thread.qualityOfService = .userInteractive
        thread.start()
        
        print(qos_class_main())
        
        wait(for: [expect], timeout: 10)
    }
}
