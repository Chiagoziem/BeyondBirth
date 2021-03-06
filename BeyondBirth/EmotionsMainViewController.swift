//  Rachael Metzger
//  Beyond Birth Senior Design
//  EmotionsMainViewController.swift
//  Emotions Main PageBeyond
// --------------------------------------------------
// The code below holds the buttons that connect to
// the corresponding motivational images for that
// emotion. To add more buttons, just copy code and
// change label names 37
// --------------------------------------------------
// Word Count: 47
import UIKit

class EmotionsMainViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // calls all functions
    func setupViews() {
        navigationItem.title = "Emotion Menu"
        
        view.backgroundColor = UIColor.white
        
        view.addSubview(happyButton)
        view.addSubview(sadButton)
        
        setUpHappy()
        setUpSad()
    }
    
    // happy button
    let happyButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.backgroundColor = UIColor.blue
        bt.setTitle("Happy", for: .normal)
        bt.setTitleColor(UIColor.white, for: .normal)
        bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.addTarget(self, action: #selector(goToEmotionViewController), for: .touchUpInside)
        return bt
    }()
    
    // sad button
    let sadButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.backgroundColor = UIColor.blue
        bt.setTitle("Sad", for: .normal)
        bt.setTitleColor(UIColor.white, for: .normal)
        bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.addTarget(self, action: #selector(goToEmotionViewController), for: .touchUpInside)
        return bt
    }()
    
    @objc func goToEmotionViewController(sender: UIButton!) {
        let emotion = sender.titleLabel?.text!.lowercased()
        let flowLayout = UICollectionViewFlowLayout()
        let customCollectionViewController = EmotionViewController(collectionViewLayout: flowLayout)
        customCollectionViewController.emotionText = emotion!
        self.navigationController?.pushViewController(customCollectionViewController, animated: true)
    }
    
    // setting constraints
    func setUpHappy(){
        happyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        happyButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        happyButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        happyButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func setUpSad(){
        sadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        sadButton.bottomAnchor.constraint(equalTo: happyButton.topAnchor, constant: -12).isActive = true
        sadButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        sadButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
}

