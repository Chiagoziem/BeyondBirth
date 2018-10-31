//
//  CalendarViewController.swift
//  BeyondBirth
//
//  Created by Jordan George on 10/26/18.
//  Copyright © 2018 Jordan George. All rights reserved.
//

import UIKit
import Firebase

class CalendarViewController: UIViewController, UITableViewDataSource {
    
    let reuseID = "cell"
    var appointments = [Appointment]()
    let DatabaseRef = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addcalendaritem))
        
//        tableView.register(CustomTableCell.self, forCellReuseIdentifier: reuseID)
        
        setupViews()
        loadImages()
    }
    
    @objc func addcalendaritem(){
        present(AddCalendarItemViewController(), animated: true, completion: nil)
    }
    
    func loadImages() {
        appointments.removeAll()
        tableView.reloadData()
        observeAllAppointments()
    }
    
    func observeAllAppointments() {
        let ref = DatabaseRef.child("appointments")
        
        ref.queryOrdered(byChild: "date").observe(.childAdded, with: { (snapshot) in
            
            if let apptsnapshots = snapshot.value as? [String:AnyObject]{
                let appt = Appointment()
                
                appt.date = apptsnapshots["date"] as? String
                appt.notes = apptsnapshots["notes"] as? String
                appt.name = apptsnapshots["name"] as? String
                
                self.appointments.append(appt)
//                self.appointments = self.appointments.reversed()
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }, withCancel: nil)
        
        DatabaseRef.removeAllObservers()
    }
    
    
    func setupViews() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        setupTableView()
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CustomTableCell.self, forCellReuseIdentifier: reuseID)
        return tableView
    }()
    
    func setupTableView() {
        tableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
}

extension CalendarViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appointments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseID, for: indexPath)
        
        let name = (appointments[indexPath.row].name)!
        cell.textLabel!.text = "\(name)"
        
        return cell
    }
}

class CustomTableCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
