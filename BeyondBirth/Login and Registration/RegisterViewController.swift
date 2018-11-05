//
//  RegisterViewController.swift
//  BeyondBirth
//
//  Created by Jordan George on 10/12/18.
//  Copyright © 2018 Jordan George. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    var loggedInUser = LoggedInUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.lightGray
        setupViews()
    }
    
    func registerUserIntoDatabaseWithUID(_ uid: String, values: [String: Any]) {
        let ref = Database.database().reference()
        let usersReference = ref.child("users").child(uid)
        
        usersReference.updateChildValues(values, withCompletionBlock: { (error, ref) in
            if error != nil {
                print(error!)
                return
            }
            
            self.loggedInUser.email = (values["email"] as! String)
        })
    }
    
    func alert(title: String = "", message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func handleRegisterButton() {
        guard let email = emailTextField.text,
            let password = passwordTextField.text,
            let repeatedPassword = repeatPasswordTextField.text else {
                print("Form is not valid")
                return
        }
        
        // alerts for invalid registration info
        if email.contains("@") == false {
            alert(title: "Email Error", message: "Not a valid email.")
            return
        }
        if password.count < 6 || repeatedPassword.count < 6 {
            alert(title: "Password Error", message: "Need at least 6 charactors for passwords")
            return
        }
        if password != repeatedPassword {
            alert(title: "Password Error", message: "Make sure your passwords match.")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            guard let user = authResult?.user else { return }
            
            if error != nil {
                print(error!)
                return
            }
            
            let uid = user.uid
            let values = ["email": email]
            self.registerUserIntoDatabaseWithUID(uid, values: values as [String : Any])
            
            self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
        }
    }
    
    @objc func handleLoginButton() {
        present(LoginViewController(), animated: true, completion: nil)
    }
    
    // MARK: - keyboard
    
    // Hide keyboard when user touches outside keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // Switches focus to next text field
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextField.resignFirstResponder()
        
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
        emailTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 4/5).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        textField.returnKeyType = .done
        textField.isSecureTextEntry = true
        textField.placeholder = "Password"
        textField.textAlignment = .center
        textField.backgroundColor = UIColor.white
        return textField
    }()
    
    func setupPasswordTextField() {
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 12).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 4/5).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    lazy var repeatPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        textField.returnKeyType = .done
        textField.isSecureTextEntry = true
        textField.placeholder = "Repeat Password"
        textField.textAlignment = .center
        textField.backgroundColor = UIColor.white
        return textField
    }()
    
    func setupRepeatPasswordTextField() {
        repeatPasswordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        repeatPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 12).isActive = true
        repeatPasswordTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 4/5).isActive = true
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
        registerButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 3/5).isActive = true
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
