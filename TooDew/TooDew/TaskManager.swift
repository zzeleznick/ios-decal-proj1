//
//  TaskManager.swift
//  TooDew
//
//  Created by Zach Zeleznick on 3/1/16.
//  Copyright (c) 2016 zzeleznick. All rights reserved.
//

import UIKit

var taskMgr: TaskManager = TaskManager()

struct task {
    var name = "No Name"
    var desc = "No Description"
}

class TaskManager: NSObject {
    
    var tasks = [task]()
    
    func addTask(name: String, desc: String) {
        println("Going to add task with name \(name)")
        tasks.append(task(name: name, desc: desc))
    }
    
}