//
//  MenuController.swift
//  team7
//
//  Created by Chiagoziem on 11/7/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class MenuController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(r: 250, g: 255, b: 0)
        
        view.addSubview(heartButton)
        view.addSubview(journalButton)
        view.addSubview(videoButton)
        view.addSubview(resourcesButton)
        view.addSubview(appointmentButton)
        view.addSubview(groupsButton)
        view.addSubview(reportsButton)
        view.addSubview(timerButton)
        
        setupheart()
        setupjournal()
        setupvideo()
        setupResource()
        setupappointment()
        setupgroups()
        setupreports()
        setuptimer()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
    }
    
    // Logout - move to different page
    @objc func handleLogout(){
        self.navigationController?.pushViewController(LoginViewController(), animated: true)
    }
    
        @objc func timer(){
        self.navigationController?.pushViewController(TimerViewController(), animated: true)
    }
    
        @objc func video(){
        self.navigationController?.pushViewController(BreathingExcercisesViewController(), animated: true)
    }
    
        @objc func calendar(){
        self.navigationController?.pushViewController(CalendarViewController(), animated: true)
    }
    
        @objc func journal(){
        self.navigationController?.pushViewController(JournalController(), animated: true)
    }

    let heartButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 8, g: 28, b: 255)
        button.setTitle("Heart rate", for: .normal )
        button.setTitleColor(UIColor.yellow, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let journalButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 8, g: 28, b: 255)
        button.setTitle("Journal", for: .normal )
        button.setTitleColor(UIColor.yellow, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(journal), for: .touchUpInside)
        return button
    }()
    
    let videoButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 8, g: 28, b: 255)
        button.setTitle("Jin shin Jyutsu", for: .normal )
        button.setTitleColor(UIColor.yellow, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(video), for: .touchUpInside)
        return button
    }()
    
    let resourcesButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 8, g: 28, b: 255)
        button.setTitle("Resources", for: .normal )
        button.setTitleColor(UIColor.yellow, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let appointmentButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 8, g: 28, b: 255)
        button.setTitle("Appointments", for: .normal )
        button.setTitleColor(UIColor.yellow, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(calendar), for: .touchUpInside)
        return button
    }()
    
    let groupsButton
        : UIButton = {
            let button = UIButton(type: .system)
            button.backgroundColor = UIColor(r: 8, g: 28, b: 255)
            button.setTitle("Support groups", for: .normal )
            button.setTitleColor(UIColor.yellow, for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
    }()
    
    let reportsButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 8, g: 28, b: 255)
        button.setTitle("Reports", for: .normal )
        button.setTitleColor(UIColor.yellow, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let timerButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 8, g: 28, b: 255)
        button.setTitle("Reports", for: .normal )
        button.setTitleColor(UIColor.yellow, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    
    // constraints
    
    
    
    func setupheart(){
        heartButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        heartButton.bottomAnchor.constraint(equalTo: journalButton.topAnchor, constant: -12).isActive = true
        heartButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        heartButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupjournal(){
        journalButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        journalButton.bottomAnchor.constraint(equalTo: videoButton.topAnchor, constant: -12).isActive = true
        journalButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        journalButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupvideo(){
        videoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        videoButton.bottomAnchor.constraint(equalTo: resourcesButton.topAnchor, constant: -12).isActive = true
        videoButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        videoButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

    func setupResource(){
        // add constraints for x and y
        resourcesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        resourcesButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        resourcesButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        resourcesButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

    func setupappointment(){
        appointmentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        appointmentButton.topAnchor.constraint(equalTo: resourcesButton.bottomAnchor, constant: 12).isActive = true
        appointmentButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        appointmentButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupgroups(){
        groupsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        groupsButton.topAnchor.constraint(equalTo: appointmentButton.bottomAnchor, constant: 12).isActive = true
        groupsButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        groupsButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupreports(){
        reportsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        reportsButton.topAnchor.constraint(equalTo: groupsButton.bottomAnchor, constant: 12).isActive = true
        //reportsButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        reportsButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        reportsButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setuptimer(){
        timerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        timerButton.topAnchor.constraint(equalTo: reportsButton.bottomAnchor, constant: 12).isActive = true
        //reportsButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        timerButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        timerButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func preferredStatusBarStyle() -> UIStatusBarStyle{
        return .lightContent
    }
}

// so i dont have to type color: num/255 every time
extension UIColor{
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat){
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
}
