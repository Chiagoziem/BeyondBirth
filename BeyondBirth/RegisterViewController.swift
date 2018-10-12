//
//  RegisterViewController.swift
//  BeyondBirth
//
//  Created by Jordan George on 10/12/18.
//  Copyright © 2018 Jordan George. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.lightGray
        setupViews()
    }
    
    // MARK: - button actions
    
    @objc func handleRegisterButton() {
        print("123")
    }
    
    @objc func handleLoginButton() {
        present(LoginViewController(), animated: true, completion: nil)
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
            repeatPasswordTextField.becomeFirstResponder()
        } else if textField == repeatPasswordTextField {
            repeatPasswordTextField.resignFirstResponder()
        }
        
        return true
    }
    
    // MARK: - views
    
    func setupViews() {
        view.addSubview(logo)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(repeatPasswordTextField)
        view.addSubview(registerButton)
        view.addSubview(loginButton)

        setupLogo()
        setupEmailTextField()
        setupPasswordTextField()
        setupRepeatPasswordTextField()
        setupRegisterButton()
        setupLoginButton()
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
    
    lazy var repeatPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        textField.placeholder = "Repeat password"
        textField.textAlignment = .center
        textField.backgroundColor = UIColor.white
        return textField
    }()
    
    func setupRepeatPasswordTextField() {
        repeatPasswordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        repeatPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 12).isActive = true
        repeatPasswordTextField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        repeatPasswordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Register", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        //        button.tintColor =
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 220, green: 220, blue: 220).cgColor
        
        button.addTarget(self, action: #selector(handleRegisterButton), for: .touchUpInside)
        
        return button
    }()
    
    func setupRegisterButton() {
        registerButton.topAnchor.constraint(equalTo: repeatPasswordTextField.bottomAnchor, constant: 12).isActive = true
        registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registerButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Already have an account? Login.", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        
        button.addTarget(self, action: #selector(handleLoginButton), for: .touchUpInside)
        
        return button
    }()
    
    func setupLoginButton() {
        loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -12).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
}
