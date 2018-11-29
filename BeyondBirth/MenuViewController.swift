//
//  MenuController.swift
//  team7
//
//  Created by Chiagoziem on 11/7/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import Firebase

class MenuViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // check if the user is logged in before allowing the user to see/use the other capabilities
        checkIfUserIsLoggedIn()
        
        // design views
        setupViews()
    }
    
    func setupViews() {
        navigationItem.title = "Menu"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        
        view.backgroundColor = .white
        
        // view.addSubview(journalButton)
        view.addSubview(breathingButton)
        view.addSubview(appointmentButton)
        view.addSubview(timerButton)
        view.addSubview(emotionButton)
        
        // setupjournal()
        setupbreathing()
        setupappointment()
        setuptimer()
        setupemotion()
    }
    
    // checks if the current user is logged in
    func checkIfUserIsLoggedIn() {
        // if uid is nil, the user is not logged in
        if Auth.auth().currentUser?.uid == nil {
            // show login view
            perform(#selector(handleLogin), with: nil, afterDelay: 0)
        }
        // else, the user is logged in
    }
    
    // MARK: - button actions
    
    // presents login view
    @objc func handleLogin() {
        present(LoginViewController(), animated: true, completion: nil)
    }
    
    // log out the current user
    @objc func handleLogout() {
        do {
            try Auth.auth().signOut()
        } catch let logoutError {
            print(logoutError)
        }
        
        // present login view
        present(LoginViewController(), animated: true, completion: nil)
    }
    
//    @objc func journal() {
//        self.navigationController?.pushViewController(JournalViewController(), animated: true)
//    }
    
    // creates the BreathingExercisesController for breathing exercises
    @objc func breathing() {
        let flowLayout = UICollectionViewFlowLayout()
        let customCollectionViewController = BreathingExercisesViewController(collectionViewLayout: flowLayout)
        self.navigationController?.pushViewController(customCollectionViewController, animated: true)
    }
    
    @objc func appointments() {
        self.navigationController?.pushViewController(AppointmentViewController(), animated: true)
    }
    
    @objc func timer() {
        self.navigationController?.pushViewController(TimerViewController(), animated: true)
    }
    
    @objc func emotion() {
        self.navigationController?.pushViewController(EmotionsMainViewController(), animated: true)
    }
    
    // MARK: - views
    
//    let journalButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.backgroundColor = UIColor(r: 8, g: 28, b: 255)
//        button.setTitle("Journal", for: .normal )
//        button.setTitleColor(UIColor.white, for: .normal)
//        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.addTarget(self, action: #selector(journal), for: .touchUpInside)
//        return button
//    }()
    
    let breathingButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 8, g: 28, b: 255)
        button.setTitle("Breathing Exercises", for: .normal )
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(breathing), for: .touchUpInside)
        return button
    }()
    
    let appointmentButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 8, g: 28, b: 255)
        button.setTitle("Appointments", for: .normal )
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(appointments), for: .touchUpInside)
        return button
    }()
    
    let timerButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 8, g: 28, b: 255)
        button.setTitle("Timer", for: .normal )
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(timer), for: .touchUpInside)
        return button
    }()
    
    let emotionButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 8, g: 28, b: 255)
        button.setTitle("Emotions", for: .normal )
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(emotion), for: .touchUpInside)
        return button
    }()
    
    // MARK: - constraints
    
//    func setupjournal() {
//        journalButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        journalButton.bottomAnchor.constraint(equalTo: breathingButton.topAnchor, constant: -12).isActive = true
//        journalButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
//        journalButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
//    }
    
    func setupbreathing() {
        breathingButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        breathingButton.bottomAnchor.constraint(equalTo: appointmentButton.topAnchor, constant: -12).isActive = true
        breathingButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        breathingButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupappointment() {
        appointmentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        appointmentButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        appointmentButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        appointmentButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setuptimer() {
        timerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        timerButton.topAnchor.constraint(equalTo: appointmentButton.bottomAnchor, constant: 12).isActive = true
        timerButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        timerButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupemotion() {
        emotionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emotionButton.topAnchor.constraint(equalTo: timerButton.bottomAnchor, constant: 12).isActive = true
        emotionButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        emotionButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .lightContent
    }
}

// so i dont have to type color: num/255 every time
extension UIColor {
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat){
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
}
