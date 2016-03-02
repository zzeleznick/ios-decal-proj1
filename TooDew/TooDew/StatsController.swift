//
//  StatsController.swift
//  TooDew
//
//  Created by Zach Zeleznick on 3/1/16.
//  Copyright (c) 2016 zzeleznick. All rights reserved.
//

import UIKit

class StatsController: UIViewController{
    
    @IBOutlet weak var homeButton: UIBarButtonItem!
    @IBOutlet weak var numberCompleted: UILabel!

    @IBAction func userClicksHome(sender: UIBarButtonItem) {
        goForward()
    }

    @IBAction func userSwipesLeft(sender: UISwipeGestureRecognizer) {
        goForward()
    }
    
    func updateCount(){
        var count = 0
        let length = taskMgr.tasks.count
        if length > 0 {
            let allTasks = taskMgr.tasks
            for t in allTasks {
                count += Int(t.completed)
            }
        }
        println("Found Count of \(count)")
        numberCompleted?.text = "\(count)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        updateCount()
    }
    
    func goForward() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = storyboard.instantiateViewControllerWithIdentifier("RootMain")  as! UIViewController?
        self.presentViewController(mainVC!, animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}