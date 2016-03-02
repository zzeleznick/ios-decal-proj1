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
    var created: NSDate!
    var completed = false
}

class TaskManager: NSObject {
    
    var tasks = [task]()
    
    func addTask(name: String, desc: String) {
        println("Going to add task:\nName: \(name) Desc: \(desc)")
        tasks.append(task(name: name, desc: desc, created: NSDate(), completed: false))
    }
    func deleteTask(index: Int) {
        var myTask = tasks[index]
        println("Going to delete task:\nName: \(myTask.name) Desc: \(myTask.desc)")
        tasks.removeAtIndex(index)
    }
    func completeTask(index: Int) {
        var myTask = tasks[index]
        println("Going to Complete task:\nName: \(myTask.name) Desc: \(myTask.desc)")
        myTask.created = NSDate()
        myTask.completed = true
        tasks[index] = myTask
    }
    
}