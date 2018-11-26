//
//  EmotionsMainViewController.swift
//  BeyondBirth
//
//  Created by Rachael Metzger on 11/25/18.
//  Copyright © 2018 Rachael Metzger. All rights reserved.
//

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
        bt.setTitleColor(UIColor.black, for: .normal)
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
        bt.setTitleColor(UIColor.black, for: .normal)
        bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.addTarget(self, action: #selector(goToEmotionViewController), for: .touchUpInside)
        return bt
    }()
    
    @objc func goToEmotionViewController(sender: UIButton!) {
        let emotion = sender.titleLabel?.text!.lowercased()
        let flowLayout = UICollectionViewFlowLayout()
        let customCollectionViewController = EmotionViewController(collectionViewLayout: flowLayout)
        customCollectionViewController.emotion = emotion!
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

