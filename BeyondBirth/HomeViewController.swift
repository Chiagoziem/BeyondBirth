//
//  HomeViewController.swift
//  BeyondBirth
//
//  Created by Jordan George on 10/26/18.
//  Copyright © 2018 Jordan George. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkIfUserIsLoggedIn()
        
        // design views
        view.backgroundColor = UIColor.white
        view.addSubview(logoutButton)
        view.addSubview(calendarButton)
        setupLogoutButton()
        setupCalendarButton()
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
    
    // presents login view
    @objc func handleLogin() {
        present(LoginViewController(), animated: true, completion: nil)
    }
    
    // presents calendar view
    @objc func openCalendar() {
        self.navigationController?.pushViewController(CalendarViewController(), animated: true)
    }
    
    // MARK: - views
    
    lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("logout", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 220, green: 220, blue: 220).cgColor
        button.addTarget(self, action: #selector(handleLogout), for: .touchUpInside)
        return button
    }()
    
    func setupLogoutButton() {
        logoutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoutButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        logoutButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    lazy var calendarButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("calendar", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 220, green: 220, blue: 220).cgColor
        button.addTarget(self, action: #selector(openCalendar), for: .touchUpInside)
        return button
    }()
    
    func setupCalendarButton() {
        calendarButton.topAnchor.constraint(equalTo: logoutButton.bottomAnchor, constant: 12).isActive = true
        calendarButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        calendarButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        calendarButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    // MARK: - for tests
    
    func getEmail() -> String {
        return (Auth.auth().currentUser?.email)!
    }
    
}
