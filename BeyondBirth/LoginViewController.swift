//
//  LoginViewController.swift
//  BeyondBirth
//
//  Created by Jordan George on 10/12/18.
//  Copyright © 2018 Jordan George. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // FIXME: - connect to firebase
        // FIXME: - add nav bar functionality
        // FIXME: - messages in console
        // FIXME: - static widths/heights/constants
        
        view.backgroundColor = UIColor.lightGray
        setupViews()
    }
    
    // MARK: - button actions
    
    @objc func buttonPressed() {
        print("123")
    }
    
    // MARK: - keyboard
    
    // Hide keyboard when user touches outside keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextField.resignFirstResponder()
        
        // Switch focus to other text field
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            passwordTextField.resignFirstResponder()
        }
        return true
    }
    
    // MARK: - views
    
    func setupViews() {
        view.addSubview(logo)
        view.addSubview(emailTextField)
        view.addSubview(loginButton)
        view.addSubview(registerButton)
        view.addSubview(passwordTextField)
        
        setupLogo()
        setupEmailTextField()
        setupLoginButton()
        setupRegisterButton()
        setupPasswordTextField()
    }
    
    lazy var logo: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Beyond Birth-door graphic white")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    func setupLogo() {
        logo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logo.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        logo.widthAnchor.constraint(equalToConstant: 200).isActive = true
        logo.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        textField.placeholder = "Email"
        textField.textAlignment = .center
        textField.backgroundColor = UIColor.white
        return textField
    }()
    
    func setupEmailTextField() {
        emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailTextField.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 50).isActive = true
        emailTextField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        textField.placeholder = "Password"
        textField.textAlignment = .center
        textField.backgroundColor = UIColor.white
        return textField
    }()
    
    func setupPasswordTextField() {
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 12).isActive = true
        passwordTextField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
//        button.tintColor =
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 220, green: 220, blue: 220).cgColor
        
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        return button
    }()
    
    func setupLoginButton() {
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 12).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Don't have an account? Register", for: .normal)
        button.setTitleColor(.blue, for: .normal)

        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        return button
    }()
    
    func setupRegisterButton() {
        registerButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -12).isActive = true
        registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registerButton.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
}

extension UIColor {
    convenience init(red: Int = 0, green: Int = 0, blue: Int = 0, opacity: Int = 255) {
        precondition(0...255 ~= red   &&
            0...255 ~= green &&
            0...255 ~= blue  &&
            0...255 ~= opacity, "input range is out of range 0...255")
        self.init(red: CGFloat(red)/255, green: CGFloat(green)/255, blue: CGFloat(blue)/255, alpha: CGFloat(opacity)/255)
    }
}


