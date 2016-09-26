//
//  TaskManager.swift
//  pomo
//
//  Created by Daniel Cortez on 9/25/16.
//  Copyright © 2016 HCD. All rights reserved.
//

import Foundation


class TaskManager {
    
    var startDate = Date()
    var taskDuration = 0.0

    
    /**
     *  Begins the countdown of the current task.
     */
    func startNewTask() {
        taskDuration = 0.0
        startDate = Date()
    }
    
    /**
     *  Pause the countdown of the current task.
     */
    func pauseTask() {
        incrementTaskDuration()
        startDate = Date()
    }
    
    /**
     *  Resumes the current task.
     */
    func resumeTask() {
        startDate = Date()
    }
    
    /**
     *  Ends the current task.
     */
    
    func endTask() {
        incrementTaskDuration()
        startDate = Date()
        taskDuration = 0.0
    }
    
}


// MARK: - Private Utility Methods
fileprivate extension TaskManager {
    
    /**
     *  Increments the taskDuration by the time since the start/resume of a task
     */
     func incrementTaskDuration() {
            let endDate = Date()
            taskDuration += endDate.timeIntervalSince(startDate)
                
    }
    
}
