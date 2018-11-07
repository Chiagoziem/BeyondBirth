//
//  LoginController.swift
//  team7
//
//  Created by Admin on 11/7/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    // create a table for user login info
    let userInfo: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blue
        view.translatesAutoresizingMaskIntoConstraints = false
        // make the edges of the box curved
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    // allow user to register
    let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 8, g: 28, b: 255)
        button.setTitle("Register", for: .normal )
        button.setTitleColor(UIColor.yellow, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // allow user to enter name email and password
    let nameField: UITextField = {
        let text = UITextField()
        text.placeholder = "Name"
        text.textColor = UIColor.yellow
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    let nameSeperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 255, g: 245, b: 8)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let emailField: UITextField = {
        let text = UITextField()
        text.placeholder = "email"
        text.textColor = UIColor.yellow
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    let emailSeperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 255, g: 245, b: 8)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let passwordField: UITextField = {
        let text = UITextField()
        text.placeholder = "email"
        text.isSecureTextEntry = true
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
}()
    
    
    // standard main
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(r: 250, g: 255, b: 0)
        
        view.addSubview(userInfo)
        view.addSubview(registerButton)
        
        setupConstraints()
        setupRegister()
    }
    
    // placement of register button
    func setupRegister(){
        // add constraints for x and y
        registerButton.centerXAnchor.constraint(equalTo: userInfo.centerXAnchor).isActive = true
        registerButton.topAnchor.constraint(equalTo: userInfo.bottomAnchor, constant: 12).isActive = true
        
        // give the button a height and width
        registerButton.widthAnchor.constraint(equalTo: userInfo.widthAnchor).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    // Placement for the user input boxes
    func setupConstraints(){
        // add constraints for placement and rotation
        userInfo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        userInfo.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        // give the table a size
        userInfo.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        userInfo.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        // name and name seperator
        userInfo.addSubview(nameField)
        userInfo.addSubview(nameSeperatorView)
        userInfo.addSubview(emailField)
        userInfo.addSubview(emailSeperatorView)
        userInfo.addSubview(passwordField)

        nameField.leftAnchor.constraint(equalTo: userInfo.leftAnchor, constant: 12).isActive = true
        nameField.topAnchor.constraint(equalTo: userInfo.topAnchor).isActive = true
        nameField.widthAnchor.constraint(equalTo: userInfo.widthAnchor).isActive = true
        nameField.heightAnchor.constraint(equalTo: userInfo.heightAnchor, multiplier: 1/3).isActive = true
        
        nameSeperatorView.leftAnchor.constraint(equalTo: userInfo.leftAnchor, constant: 12).isActive = true
        nameSeperatorView.topAnchor.constraint(equalTo: nameField.bottomAnchor).isActive = true
        nameSeperatorView.widthAnchor.constraint(equalTo: userInfo.widthAnchor).isActive = true
        nameSeperatorView.heightAnchor.constraint(equalToConstant: 3).isActive = true
        
        
        // email and email seperator
        emailField.leftAnchor.constraint(equalTo: userInfo.leftAnchor, constant: 12).isActive = true
        emailField.topAnchor.constraint(equalTo: nameSeperatorView.topAnchor).isActive = true
        emailField.widthAnchor.constraint(equalTo: userInfo.widthAnchor).isActive = true
        emailField.heightAnchor.constraint(equalTo: userInfo.heightAnchor, multiplier: 1/3).isActive = true
        
        emailSeperatorView.leftAnchor.constraint(equalTo: userInfo.leftAnchor, constant: 12).isActive = true
        emailSeperatorView.topAnchor.constraint(equalTo: emailField.bottomAnchor).isActive = true
        emailSeperatorView.widthAnchor.constraint(equalTo: userInfo.widthAnchor).isActive = true
        emailSeperatorView.heightAnchor.constraint(equalToConstant: 3).isActive = true
        
        
        // password
        passwordField.leftAnchor.constraint(equalTo: userInfo.leftAnchor, constant: 12).isActive = true
        passwordField.topAnchor.constraint(equalTo: emailSeperatorView.topAnchor).isActive = true
        passwordField.widthAnchor.constraint(equalTo: userInfo.widthAnchor).isActive = true
        passwordField.heightAnchor.constraint(equalTo: userInfo.heightAnchor, multiplier: 1/3).isActive = true
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
