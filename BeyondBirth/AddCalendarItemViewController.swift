//
//  AddCalendarItem.swift
//  BeyondBirth
//
//  Created by Jordan George on 10/26/18.
//  Copyright © 2018 Jordan George. All rights reserved.
//

import UIKit

class AddCalendarItemViewController: UIViewController {
    
    let borderColor = UIColor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupViews()
    }
    
    func setupViews() {
        view.addSubview(nameTextField)
        view.addSubview(datePickerTextField)
        view.addSubview(notesTextView)
        view.addSubview(submitButton)
        
        setupNameTextField()
        setupDatePickerTextField()
        setupNotesTextView()
        setupSubmitButton()

        datePickerTextField.inputView = datePicker
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(AddCalendarItemViewController.tapToLeave(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    // MARK: - keyboard functions
    
    
    
    // MARK: - views
    
    var nameTextField: UITextField = {
        let textField =  UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Apointment Name"
        textField.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0).cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        return textField
    }()
    
    func setupNameTextField() {
        nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 9/10).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    var datePickerTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Select Date"
        textField.textAlignment = .center
        textField.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0).cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        return textField
    }()
    
    func setupDatePickerTextField() {
        datePickerTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        datePickerTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 12).isActive = true
        datePickerTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 9/10).isActive = true
        datePickerTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .dateAndTime
        datePicker.addTarget(self, action: #selector(AddCalendarItemViewController.dateSelected(datePicker:)), for: .valueChanged)
        return datePicker
    }()

    @objc func tapToLeave(gestureRecognizer: UITapGestureRecognizer){
        view.endEditing(true)
    }

    // formats the date selected and places it into the UI Text Field
    @objc func dateSelected(datePicker: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEEEEEE LLL dd hh:mm aaa"
        datePickerTextField.text = dateFormatter.string(from: datePicker.date)
    }
    
    var notesTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0).cgColor
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 5
        return textView
    }()

    func setupNotesTextView() {
        notesTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        notesTextView.topAnchor.constraint(equalTo: datePickerTextField.bottomAnchor, constant: 12).isActive = true
        notesTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 9/10).isActive = true
        notesTextView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }

    lazy var submitButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Submit", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(handleSubmitButton), for: .touchUpInside)
        return button
    }()

    func setupSubmitButton() {
        submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        submitButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        submitButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 9/10).isActive = true
        submitButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc func handleSubmitButton() {
        print("123")
    }
    
}
