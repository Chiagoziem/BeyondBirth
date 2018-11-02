//
//  ViewController.swift
//  Time
//
//  Created by Rachael Metzger on 11/1/18.
//  Copyright © 2018 Rachael Metzger. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    // play button
    var playButton: UIButton!

    func startButton() {
        playButton = UIButton(type: .system)
        playButton.backgroundColor = UIColor.blue
        playButton.setTitleColor( .black, for: .normal)
        playButton.setTitle("Start", for: .normal)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.bounds = CGRect(x: 300, y: 300, width: 250, height: 50)
        playButton.center = CGPoint(x: 200, y: 400)
        playButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        view.addSubview(playButton)

    }
    
    // pause button
    var pauseButton: UIButton!
    func stopButton() {
        pauseButton = UIButton(type: .system)
        pauseButton.backgroundColor = UIColor.blue
        pauseButton.setTitleColor( .black, for: .normal)
        pauseButton.setTitle("Pause", for: .normal)
        pauseButton.translatesAutoresizingMaskIntoConstraints = false
        pauseButton.bounds = CGRect(x: 300, y: 300, width: 250, height: 50)
        pauseButton.center = CGPoint(x: 200, y: 500)
        pauseButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        view.addSubview(pauseButton)
    }
    
    // restart button
    var resetButton: UIButton!
    func restartButton(){
        resetButton = UIButton(type: .system)
        resetButton.backgroundColor = UIColor.blue
        resetButton.setTitleColor( .black, for: .normal)
        resetButton.setTitle("Restart", for: .normal)
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        resetButton.bounds = CGRect(x: 300, y: 300, width: 250, height: 50)
        resetButton.center = CGPoint(x: 200, y: 600)
        resetButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        view.addSubview(resetButton)
    }
    
    // Timer lable
    //@IBOutlet weak var TimerLable: UILabel!
    var TimerLable: UILabel = {
        let lb = UILabel()
        lb.frame = CGRect(x: 300, y: 300, width: 150, height: 50)
        lb.textAlignment = .center
        lb.textColor = .black
        lb.font = UIFont.systemFont(ofSize: 50)
        lb.center = CGPoint(x: 200, y: 200)
        
        return lb
        
    }()
    var time = 0
    var timer = Timer()
    
    func timerLB(){
        view.addSubview(TimerLable)
        action()
    }
    
    // calls all views
    func setUpViews(){
        view.backgroundColor = .white
        startButton()
        stopButton()
        restartButton()
        timerLB()
    }
    
    // action functions
    // start
    @IBAction func start(_ sender: UIButton){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimeViewController.action), userInfo: nil, repeats: true)
    }
    // stop
    @IBAction func stop(_ sender: AnyObject){
        timer.invalidate()
    }
    
    // reset
    @IBAction func reset(_ sender: AnyObject){
        timer.invalidate()
        time = 0;
        TimerLable.text = ("0.0")
    }
    
    @objc func action(){
        time += 1
        TimerLable.text = String(time)
    }
    
    // run
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
}
