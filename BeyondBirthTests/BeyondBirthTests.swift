//
//  BeyondBirthTests.swift
//  BeyondBirthTests
//
//  Created by Jordan George on 11/4/18.
//  Copyright © 2018 Jordan George. All rights reserved.
//

import XCTest
@testable import BeyondBirth
import Firebase

class BeyondBirthTests: XCTestCase {
    
    // make sure that this test file is working
    func testHello() {
        var helloWorld: String?
        XCTAssertNil(helloWorld)
        helloWorld = "hello"
        XCTAssertEqual(helloWorld, "hello")
    }
    
    func testApptIsAnEmptyString() {
        let appt = Appointment(key: "", name: "", dateString: "", date: "", notes: "")
        XCTAssertEqual(appt.date, "")
    }
    
    func testUserEmailIsAnEmptyString() {
        let user = LoggedInUser(email: "")
        XCTAssertEqual(user.email, "")
    }
    
    func testRandom() {
        
//        let uid = Auth.auth().currentUser!.uid
        
    }
    
    
//    override func setUp() {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDown() {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testExample() {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
