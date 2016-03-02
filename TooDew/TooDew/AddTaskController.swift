//
//  AddTaskController.swift
//  TooDew
//
//  Created by Zach Zeleznick on 3/1/16.
//  Copyright (c) 2016 zzeleznick. All rights reserved.
//

import UIKit

class AddTaskController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var txtTask: UITextField!
    
    @IBOutlet weak var txtDesc: UITextField!
    
    @IBOutlet weak var addTaskButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBAction func addTaskClick(sender: UIButton) {
        println("A task was added with text: \(txtTask.text)")
        taskMgr.addTask(txtTask.text, desc: txtDesc.text)
        self.view.endEditing(true)
        txtTask.text = ""
        txtDesc.text = ""
        goBack()
    }
    
    @IBAction func cancelTaskClick(sender: UIButton) {
        println("A task was cancelled.")
        goBack()
    }
    
    
    
    @IBAction func userSwipedLeft(sender: UISwipeGestureRecognizer) {
        print("User swipedped on Name VC")
        goBack()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
  
    }
    
    func goBack() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = storyboard.instantiateViewControllerWithIdentifier("RootMain")  as! UIViewController?
        self.presentViewController(mainVC!, animated: true, completion: nil)
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //UITextField Delegate
    func textFieldShouldClear(textField: UITextField) -> Bool {
        // called when clear button pressed. return NO to ignore (no notifications)
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // called when 'return' key pressed. return NO to ignore.
        textField.resignFirstResponder()
        return true
    }
    
}

