//
//  CalendarViewController.swift
//  BeyondBirth
//
//  Created by Jordan George on 10/26/18.
//  Copyright © 2018 Jordan George. All rights reserved.
//

import UIKit
import Firebase

class AppointmentViewController: UIViewController, UITableViewDataSource {
    
    let reuseIdentifier = "cell"
    let DatabaseRef = Database.database().reference()
    var appointments = [Appointment]() // stores appointments from database
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // design and position views
        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadAppointments()
    }
    
    @objc func goToAddAppointmentItemViewController(){
        self.navigationController?.pushViewController(AddAppointmentItemViewController(), animated: true)
    }
    
    func loadAppointments() {
        appointments.removeAll()
        observeAllAppointments()
    }
    
    // retrieve all appointments for user from firebase
    func observeAllAppointments() {
        let uid = Auth.auth().currentUser?.uid
        let ref = DatabaseRef.child("appointments").child(uid!)
        
        ref.queryOrdered(byChild: "date").observe(.childAdded, with: { (snapshot) in
            if let apptSnapshots = snapshot.value as? [String : Any] {
                let appt = Appointment(key: apptSnapshots["key"] as! String,
                                       name: apptSnapshots["name"] as! String,
                                       dateString: apptSnapshots["dateString"] as! String,
                                       date: apptSnapshots["date"] as! String,
                                       notes: apptSnapshots["notes"] as! String)
                self.appointments.append(appt)
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }, withCancel: nil)
        
        DatabaseRef.removeAllObservers()
    }
    
    // MARK: - view setup
    
    func setupViews() {
        navigationItem.title = "Appointments"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(goToAddAppointmentItemViewController))
        view.backgroundColor = .white
        view.addSubview(tableView)
        setupTableView()
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        return tableView
    }()
    
    func setupTableView() {
        tableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
}

// overrides table view functions needed for table view to work
extension AppointmentViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appointments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! CustomTableViewCell
        
        let name = (appointments[indexPath.row].name)!
        let date = (appointments[indexPath.row].dateString)!
        
        cell.nameLabel.text = name
        cell.dateLabel.text = date
        
        return cell
    }
    
    // for deletion
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // for deletion
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            let appt = appointments[indexPath.row]
            
            let uid = Auth.auth().currentUser?.uid
            
            let ref = DatabaseRef.child("appointments").child(uid!).child(appt.key!)
            
            ref.removeValue { (error, ref) in
                if error != nil {
                    print(error!)
                }
                
                self.appointments.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        }
    }
}

// formats the custom table view cell
class CustomTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(nameLabel)
        addSubview(dateLabel)
        setupNameLabel()
        setupDateLabel()
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "text"
        return label
    }()
    
    func setupNameLabel() {
        nameLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    }
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "text"
        return label
    }()
    
    func setupDateLabel() {
        dateLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        dateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
    }
}
