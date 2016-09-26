//
//  TaskTest.swift
//  pomo
//
//  Created by Daniel Cortez on 9/25/16.
//  Copyright © 2016 HCD. All rights reserved.
//

import XCTest
@testable import pomo

class TaskTest: XCTestCase {
    
    var task : Task?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        task = Task(startDate: Date(), title: String.randomStringWithLength(10))
   
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        task = nil
    }
    
    
    func testInit() {
        let date =  Date()
        let text =  String.randomStringWithLength(10)
        let nTask = Task(startDate: date, title: text)
        
        XCTAssertEqual(date, nTask.startDate, "Dates are not equal")
        XCTAssertEqual(text, nTask.title, "Text are not Equal")
        
    }
    
    func testEncodeDecode() {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWith: data)
        let key =  String.randomStringWithLength(10)
        archiver.encode(task, forKey: key)
        archiver.finishEncoding()
        
        let unarchiver = NSKeyedUnarchiver(forReadingWith: data as Data)
        let uTask = unarchiver.decodeObject(forKey: key) as! Task
        
        XCTAssertEqual(task!.startDate, uTask.startDate, "Dates are not Equal")
        XCTAssertEqual(task!.title, uTask.title, "Start Text are not Equal")
        
    }

    
}
