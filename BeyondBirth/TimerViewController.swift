// Rachael Metzger
// Beyond Birth Senior Design
//  ViewController.swift
//  Time
// ---------------------------------------------
// the code below runs a simple stopwatch
// it starts at seconds, and increments
// untill stopped or reset.
// there is no limit to the time, it will
// run infinitly if needed
// ---------------------------------------------
// code comment word count: 81

import UIKit

class TimerViewController: UIViewController {
    // variables
    var hours = 0
    var minutes = 0
    var seconds = 0
    //    var fractions = 0
    var timer = Timer()
    
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
        playButton.addTarget(self, action: #selector(start(_:)), for: .touchUpInside)
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
        pauseButton.addTarget(self, action: #selector(stop(_:)), for: .touchUpInside)
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
        resetButton.addTarget(self, action: #selector(reset(_:)), for: .touchUpInside)
        view.addSubview(resetButton)
    }
    
    // Timer lable
    // evenually, we can add a second label just for fractions and it will run smoother
    //@IBOutlet weak var TimerLable: UILabel!
    var TimerLable: UILabel = {
        let lb = UILabel()
        lb.frame = CGRect(x: 300, y: 300, width: 350, height: 100)
        lb.textAlignment = .center
        lb.textColor = .black
        lb.font = UIFont.systemFont(ofSize: 50)
        lb.center = CGPoint(x: 200, y: 200)
        
        return lb
        
    }()
    
    func timerLB(){
        
        view.addSubview(TimerLable)
        action()
    }
    
    // calls all views
    func setUpViews(){
        startButton()
        stopButton()
        restartButton()
        timerLB()
    }
    
    // action functions
    // start
    @IBAction func start(_ sender: UIButton){
        [timer.invalidate()] // this takes care of speeding up clock on multiple clicks on start
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(TimerViewController.action), userInfo: nil, repeats: true)
    }
    // stop
    @IBAction func stop(_ sender: UIButton){
        timer.invalidate()
    }
    
    // reset
    @IBAction func reset(_ sender: UIButton){
        timer.invalidate()
        //fractions = 0
        seconds = 0
        minutes = 0
        hours = 0
        TimerLable.text = ("0:0:0")
    }
    
    // runs count so we can track seonds, minutes, and hour
    @objc func action(){
        //        fractions += 1
        //        if fractions > 99 {
        //            seconds += 1
        //            fractions = 0
        //        }
        seconds += 1
        if seconds == 60{
            minutes += 1
            seconds = 0
        }
        if minutes == 60{
            hours += 1
            minutes = 0
        }
        
        TimerLable.text = "\(hours):\(minutes):\(seconds) "
    }
    
    // run
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
}

