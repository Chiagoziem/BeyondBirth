//
//  AddCalendarItemViewController.swift
//  BeyondBirth
//
//  Created by Jordan George on 10/26/18.
//  Copyright © 2018 Jordan George. All rights reserved.
//

import UIKit
import Firebase

class AddCalendarItemViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // designs and positions the views
        setupViews()
    }
    
    @objc func handleSubmitButton() {
        let ref: DatabaseReference = Database.database().reference()
        
        
        
        //        let date = datePicker.date
        let date = datePicker.date as NSDate
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd, H:mm:ss"
        let defaultTimeZoneStr = formatter.string(from: date as Date)
        
        
        
        
        let values: [String: Any] = [
            "name": nameTextField.text!,
            "dateString": datePickerTextField.text!,
            "date": defaultTimeZoneStr,
            "notes": notesTextView.text
        ]
        
        let key = ref.childByAutoId().key
        
        ref.child("appointments").child(key!).setValue(values)
        
        navigationController?.popViewController(animated: true)
    }
    
    func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(nameTextField)
        view.addSubview(datePickerTextField)
        view.addSubview(notesTextView)
        view.addSubview(submitButton)
        
        setupNameTextField()
        setupDatePickerTextField()
        setupNotesTextView()
        setupSubmitButton()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEEEEEE LLL dd hh:mm aaa"
        datePickerTextField.text = dateFormatter.string(from: Date())
        
        datePickerTextField.inputView = datePicker
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(AddCalendarItemViewController.tapToLeave(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    // allows the user to tap outside of the datepicker to close it
    @objc func tapToLeave(gestureRecognizer: UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    // formats the date selected and places it into the UI Text Field
    @objc func dateSelected(datePicker: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEEEEEE LLL dd hh:mm aaa"
        datePickerTextField.text = dateFormatter.string(from: datePicker.date)
    }
    
    // MARK: - views
    
    // creates text field for appointment name
    var nameTextField: UITextField = {
        let textField =  UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Apointment Name"
        textField.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0).cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        
        // left padding
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 0))
        textField.leftView = leftView
        textField.leftViewMode = .always
        
        return textField
    }()
    
    // positions the appointment name text field
    func setupNameTextField() {
        nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 9/10).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    // creates text field for the date picker
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
    
    // positions the date picker text field
    func setupDatePickerTextField() {
        datePickerTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        datePickerTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 12).isActive = true
        datePickerTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 9/10).isActive = true
        datePickerTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    // creates the date picker
    lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .dateAndTime
        datePicker.addTarget(self, action: #selector(AddCalendarItemViewController.dateSelected(datePicker:)), for: .valueChanged)
        return datePicker
    }()
    
    // creates text view for notes
    var notesTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0).cgColor
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 5
        textView.font = .systemFont(ofSize: 16)
        return textView
    }()

    // positions the notes text view
    func setupNotesTextView() {
        notesTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        notesTextView.topAnchor.constraint(equalTo: datePickerTextField.bottomAnchor, constant: 12).isActive = true
        notesTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 9/10).isActive = true
        notesTextView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    // creates submit button
    lazy var submitButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Submit", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(handleSubmitButton), for: .touchUpInside)
        return button
    }()
    
    // positions submit button
    func setupSubmitButton() {
        submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        submitButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        submitButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 9/10).isActive = true
        submitButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
}
