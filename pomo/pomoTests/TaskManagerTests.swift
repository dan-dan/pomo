//
//  TaskManager.swift
//  pomo
//
//  Created by Daniel Cortez on 9/25/16.
//  Copyright © 2016 HCD. All rights reserved.
//

import XCTest
@testable import pomo


class TaskManagerTests: XCTestCase {
    
    var manager : TaskManager!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        manager = TaskManager()

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        manager = nil

    }
    
    
    func testTaskManagerInit() {
        
        
    }
    
    
    func testTaskManagerDidStart() {
        
        let start = Date()
        manager.startNewTask()
        XCTAssertNotNil(manager.startDate, "Start Date is nil")
        XCTAssertEqualWithAccuracy(start.timeIntervalSinceReferenceDate, manager.startDate.timeIntervalSinceReferenceDate, accuracy:0.001, "Date are not equal")
        
        
    }
    
    func testTaskManagerDidPause() {
        let start = Date()
        manager.startNewTask()
        sleep(2)
        
        manager.pauseTask()
        
        let end = Date()
        let controlInterval = end.timeIntervalSince(start)
        
        XCTAssertGreaterThan(manager.taskDuration, 0, "Duration is Zero")
        XCTAssertEqualWithAccuracy(controlInterval, manager.taskDuration, accuracy:0.001, "Duration is not Equal")
        
    }
    
    func testTaskManagerDidResume() {
        let start = Date()
        manager.startNewTask()
        sleep(2)
        
        manager.pauseTask()
        let mid = Date()
        var controlInterval = mid.timeIntervalSince(start)
        
        manager.resumeTask()
        XCTAssertNotNil(manager.startDate, "Start Date is nil")
        sleep(2)
        manager.pauseTask()
        
        let end = Date()
        controlInterval  += end.timeIntervalSince(mid)
        
        XCTAssertGreaterThan(manager.taskDuration, 0, "Duration is Zero")
        XCTAssertEqualWithAccuracy(controlInterval, manager.taskDuration, accuracy:0.001, "Duration is not equal")
        
    }
    
    func testTaskManagerEnd() {
        
        let start = Date()
        manager.startNewTask()
        sleep(2)
        
        manager.pauseTask()
        
        let end = Date()
        let _ = end.timeIntervalSince(start)
        manager.endTask()
        
        XCTAssertEqual(manager.taskDuration, 0, "Duration is Not Zero")
        
    }    
}
