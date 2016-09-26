//
//  Task.swift
//  pomo
//
//  Created by Daniel Cortez on 9/25/16.
//  Copyright © 2016 HCD. All rights reserved.
//

import Foundation



class Task : NSObject, NSSecureCoding {
    
    var startDate : Date
    var title : String
    
    init(startDate: Date, title: String) {
        
        self.startDate = startDate
        self.title =  title
        super.init()
    }
    
    required init(coder: NSCoder) {
        
    
        self.title = coder.decodeObject(of:NSString.self, forKey: kTaskTitleKey) as! String
        self.startDate = coder.decodeObject(of:NSDate.self, forKey:kTaskStartDateKey) as! Date
        super.init()

    }

    func encode(with coder: NSCoder) {
        
        coder.encode(startDate, forKey: kTaskStartDateKey)
        coder.encode(title, forKey: kTaskTitleKey)
    }
    
    class var supportsSecureCoding : Bool {
        return true
    }

}
