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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("MainVC did load")
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    @IBAction func addTask(sender: UIBarButtonItem) {
        println("Time to add a task!")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let addTaskVC = storyboard.instantiateViewControllerWithIdentifier("RootAddTask")  as! UIViewController?
        self.presentViewController(addTaskVC!, animated: true, completion: nil)
        
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
        return taskMgr.tasks.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // code
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "test")
        cell.textLabel?.text = taskMgr.tasks[indexPath.row].name
        cell.detailTextLabel!.text =  taskMgr.tasks[indexPath.row].desc
        return cell
    }
    
    //UITableViewDelete
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete){
            println("Delete this row: \(indexPath.row)")
            taskMgr.tasks.removeAtIndex(indexPath.row)
            //table must be reloaded explicitly
            tableTasks.reloadData()
        }
        if (editingStyle == UITableViewCellEditingStyle.Insert) {
            println("Something here\(indexPath.row)")
            //TODO: What is this?
        }
    }
    
    
}

