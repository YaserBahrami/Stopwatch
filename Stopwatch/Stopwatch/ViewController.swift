//
//  ViewController.swift
//  Stopwatch
//
//  Created by yaser on 4/21/16.
//  Copyright © 2016 yaserBahrami. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var timer = NSTimer()
    var time = 0
    
    @IBOutlet var startButton: UIBarButtonItem!
    @IBOutlet var stopButton: UIBarButtonItem!
    @IBOutlet var pauseButton: UIBarButtonItem!
    @IBOutlet var TimerBox: UILabel!
    
    @IBAction func StartStopWatch(sender: AnyObject) {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.increaseTimer), userInfo: nil, repeats: true)
        
        startButton.enabled = false;
        stopButton.enabled = true
        pauseButton.enabled = true

        
    }
    
    @IBAction func ResetStopWatch(sender: AnyObject) {
        timer.invalidate()
        time = 0
        TimerBox.text = "0"
        
        stopButton.enabled = false
        pauseButton.enabled = false
        startButton.enabled = true
    }
    
    @IBAction func PauseStopWatch(sender: AnyObject) {
        timer.invalidate()
        
        stopButton.enabled = true
        pauseButton.enabled = false
        startButton.enabled = true
    }
    
    func increaseTimer() {
        time += 1
        TimerBox.text = "\(time)"
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

