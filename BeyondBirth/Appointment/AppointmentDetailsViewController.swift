//
//  AppointmentDetailsViewController.swift
//  BeyondBirth
//
//  Created by Jordan George on 11/28/18.
//  Copyright © 2018 Jordan George. All rights reserved.
//

import UIKit

class AppointmentDetailsViewController: UIViewController {
    
    var appointment: Appointment?
    let labelWidth = CGFloat(30)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupviews()
        addData()
    }
    
    func addData() {
        let name = (appointment?.name)!
        let date = (appointment?.dateString)!
        let notes = appointment?.notes
        
        namelabel.text = "Name: \(name)"
        datelabel.text = "Date: \(date)"
        
        if notes!.isEmpty {
            noteslabel.text = "No notes to be shown"
        } else {
            noteslabel.text = notes
        }
    }
    
    func setupviews() {
        view.backgroundColor = .white
        
        // add subviews
        view.addSubview(namelabel)
        view.addSubview(datelabel)
        view.addSubview(noteslabel)
        
        // constraints
        setupnamelabel()
        setupdatelabel()
        setupnoteslabel()
    }
    
    var namelabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        // font
        label.font = UIFont.systemFont(ofSize: 20)
        
        // border
        label.layer.borderWidth = 1.0
        label.layer.cornerRadius = 8
        
        return label
    }()
    
    func setupnamelabel() {
        namelabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        namelabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        namelabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 8/10).isActive = true
        namelabel.widthAnchor.constraint(equalToConstant: labelWidth).isActive = true
    }
    
    var datelabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        // font
        label.font = UIFont.systemFont(ofSize: 20)
        
        // border
        label.layer.borderWidth = 1.0
        label.layer.cornerRadius = 8
        
        return label
    }()
    
    func setupdatelabel() {
        datelabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        datelabel.topAnchor.constraint(equalTo: namelabel.bottomAnchor, constant: 30).isActive = true
        datelabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 8/10).isActive = true
        datelabel.widthAnchor.constraint(equalToConstant: labelWidth).isActive = true
    }
    
    var noteslabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        // font
        label.font = UIFont.systemFont(ofSize: 20)
        
        // multiline
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 10
        
        // border
        label.layer.borderWidth = 1.0
        label.layer.cornerRadius = 8
        
        return label
    }()
    
    func setupnoteslabel() {
        noteslabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        noteslabel.topAnchor.constraint(equalTo: datelabel.bottomAnchor, constant: 30).isActive = true
        noteslabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 8/10).isActive = true
        noteslabel.widthAnchor.constraint(equalToConstant: labelWidth*10).isActive = true
    }
    
}
