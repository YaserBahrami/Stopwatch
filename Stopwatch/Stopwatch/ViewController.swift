//
//  ViewController.swift
//  Stopwatch
//
//  Created by yaser on 4/21/16.
//  Copyright © 2016 yaserBahrami. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate {

    
    var timer = NSTimer()
    
    var timeMiliSecond = 0
    var timeSecond = 0
    var timeMinute = 0
    
    var counter = 0;
    
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var startButton: UIBarButtonItem!
    @IBOutlet var stopButton: UIBarButtonItem!
    @IBOutlet var pauseButton: UIBarButtonItem!
    
    
    @IBOutlet var minuteLabel: UILabel!
    @IBOutlet var secondLabel: UILabel!
    @IBOutlet var miliSecondLabel: UILabel!
    
    
    
    @IBAction func reloadTableViewData(sender: AnyObject) {
        counter = 0
        tableView.reloadData()
    }
    
    @IBAction func StartStopWatch(sender: AnyObject) {
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: #selector(ViewController.increaseTimer), userInfo: nil, repeats: true)
        
        startButton.enabled = false;
        stopButton.enabled = true
        pauseButton.enabled = true

        
    }
    
    @IBAction func ResetStopWatch(sender: AnyObject)
    {
        timer.invalidate()
        
        timeMiliSecond = 0
        timeSecond = 0
        timeMinute = 0
        
        secondLabel.text = "00"
        minuteLabel.text = "00"
        miliSecondLabel.text = "00"
        
        stopButton.enabled = false
        pauseButton.enabled = false
        startButton.enabled = true
    }
    
    @IBAction func PauseStopWatch(sender: AnyObject)
    {
        timer.invalidate()
        
        stopButton.enabled = true
        pauseButton.enabled = false
        startButton.enabled = true
    }
    
    func increaseTimer()
    {
        
        timeMiliSecond += 1
        
        if(timeMiliSecond==100)
        {
            timeMiliSecond=0;
            timeSecond += 1
        }
        if(timeSecond==60)
        {
            timeSecond = 0;
            timeMinute += 1;
        }
        if(timeMinute==60)
        {
            timeMiliSecond=0
            timeSecond=0
            timeMinute=0
        }
        
        if(timeMiliSecond<10)
        {
            miliSecondLabel.text = "0\(timeMiliSecond)"
        }
        else if(timeMiliSecond>9)
        {
            miliSecondLabel.text = "\(timeMiliSecond)"
        }
        
        if(timeSecond<10)
        {
             secondLabel.text = "0\(timeSecond)"
        }
        else if(timeSecond>9)
        {
            secondLabel.text = "\(timeSecond)"
        }
        if(timeMinute<10)
        {
           minuteLabel.text = "0\(timeMinute)"
        }
        else if(timeMinute>9)
        {
            minuteLabel.text = "\(timeMinute)"
        }
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return counter;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        
        let time = minuteLabel.text! + ":" + secondLabel.text! + ":" + miliSecondLabel.text!
        cell.textLabel?.text = time
        
        return cell;
    }
    
    @IBAction func addToTableView(sender: AnyObject) {
        counter += 1
        
        tableView.beginUpdates()
        tableView.insertRowsAtIndexPaths([
            NSIndexPath(forRow: 0, inSection: 0)
            ], withRowAnimation: .Automatic)

        tableView.endUpdates()
        
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        stopButton.enabled = false
        pauseButton.enabled = false
        startButton.enabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

