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
    
    let myArray: NSArray = ["First","Second","Third"]
    let reuseID = "cell"

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addcalendaritem))
        
//        tableView.register(CustomTableCell.self, forCellReuseIdentifier: reuseID)
        
        setupViews()
    }
    
    @objc func addcalendaritem(){
        present(AddCalendarItemViewController(), animated: true, completion: nil)
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
        return myArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseID, for: indexPath)
        cell.textLabel!.text = "\(myArray[indexPath.row])"
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
