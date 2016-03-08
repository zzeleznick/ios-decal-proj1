//
//  MainViewController.swift
//  TooDew
//
//  Created by Zach Zeleznick on 3/1/16.
//  Copyright (c) 2016 zzeleznick. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableTasks: UITableView!
    @IBOutlet weak var addTaskButton: UIBarButtonItem!
    @IBOutlet weak var statsButton: UIBarButtonItem!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // println("MainVC did load")
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    @IBAction func addTask(sender: UIBarButtonItem) {
        // println("Time to add a task!")
        goForward()
    }
    
    @IBAction func userClickStats(sender: UIBarButtonItem) {
        goBack()
    }
    
    @IBAction func userSwipesRight(sender: UISwipeGestureRecognizer) {
        goBack()
    }
    
    func goBack() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = storyboard.instantiateViewControllerWithIdentifier("RootStats")  as UIViewController?
        self.presentViewController(mainVC!, animated: true, completion: nil)
    }
    
    func goForward() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = storyboard.instantiateViewControllerWithIdentifier("RootAddTask")  as UIViewController?
        self.presentViewController(mainVC!, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Returning to view
    override func viewWillAppear(animated: Bool) {
        tableTasks.reloadData()
    }
   
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // code
        // let now = NSDate()
        let count = taskMgr.tasks.count
        if count > 0 {
            let allTasks = taskMgr.tasks
            for (idx, element) in allTasks.enumerate() {
                let created = element.created
                if -(created.timeIntervalSinceNow) > 60*60*24 {
                    taskMgr.deleteTask(idx)
                }
            }
        }
        return taskMgr.tasks.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // code
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "test")
        let myTask = taskMgr.tasks[indexPath.row]
        cell.textLabel?.text = myTask.name
        cell.detailTextLabel!.text =  myTask.desc
        let isCompleted = myTask.completed
        if isCompleted {
            print("Task \(indexPath.row) is completed")
            cell.textLabel?.text = myTask.name + " [Complete]"
        }
        return cell
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // the cells you would like the actions to appear needs to be editable
        return true
    }
    
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        print("Row Tapped")
        taskMgr.completeTask(indexPath.row)
        self.tableTasks.reloadData()
        return indexPath
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        // hat-tip for multi-action to
        // http://stackoverflow.com/questions/32004557/swipe-able-table-view-cell-in-ios9-or-swift-guide-at-least
        
        let del = UITableViewRowAction(style: .Normal, title: "Delete") { action, index in
            print("Delete this row: \(indexPath.row)")
            taskMgr.deleteTask(indexPath.row)
            self.tableTasks.reloadData()
        }
        
        del.backgroundColor = UIColor.redColor()
        
        let complete = UITableViewRowAction(style: .Normal, title: "Complete") { action, index in
            print("Complete Button Tapped")
            taskMgr.completeTask(indexPath.row)
            self.tableTasks.reloadData()
        }
        complete.backgroundColor = UIColor.greenColor()
        
        return [del, complete]
    }
    
    //UITableViewDelete
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete){
            print("Delete this row: \(indexPath.row)")
            taskMgr.deleteTask(indexPath.row)
            self.tableTasks.reloadData()
        }
    }
    
    
}

