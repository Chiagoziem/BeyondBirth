//
//  ViewController.swift
//  BeyondBirth
//
//  Created by Jordan George on 10/12/18.
//  Copyright © 2018 Jordan George. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//         FIXME: - add nav bar functionality
        
        view.backgroundColor = UIColor.lightGray
        setupViews()
    }
    
    func setupViews() {
//        view.addSubview(logo)
        view.addSubview(emailTextField)
//        view.addSubview(loginButton)
//        view.addSubview(registerButton)
//        view.addSubview(passwordTextField)
        
//        setupLogo()
        setupEmailTextField()
//        setupLoginButton()
//        setupRegisterButton()
//        setupPasswordTextField()
    }
    
    var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Email"
        textField.textAlignment = .center
        textField.backgroundColor = UIColor.white
        return textField
    }()
    
    func setupEmailTextField() {
        emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        // FIXME: - static width and height
        emailTextField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
