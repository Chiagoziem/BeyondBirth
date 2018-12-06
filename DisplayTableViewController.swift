//
//  DisplayTableViewController.swift
//  CoreDataExample
//
//  Created by Farhan Syed on 4/16/17.
//  Copyright © 2017 Farhan Syed. All rights reserved.
//

import UIKit
import CoreData

class DisplayTableViewController: UITableViewController, UISearchBarDelegate {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var items: [Item] = []
    var selectedIndex: Int!
    
    var filteredData: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createSearchBar()
        
        self.tableView.estimatedRowHeight = 30
        self.tableView.rowHeight = UITableViewAutomaticDimension
                
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchData()
    }
    
    
    func fetchData() {
        
        do {
            items = try context.fetch(Item.fetchRequest())
            filteredData = items
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } catch {
            print("Couldn't Fetch Data")
        }
        
    }

}


extension DisplayTableViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        
        let date = items.reversed()[indexPath.row].date
        let time = items.reversed()[indexPath.row].time
        
        cell.textLabel?.text = items.reversed()[indexPath.row].name
        
        if let date = date, let time = time {
            let timeStamp = "Added on \(date) at \(time)"
            cell.detailTextLabel?.text = timeStamp
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           
        selectedIndex = indexPath.row
        
        performSegue(withIdentifier: "UpdateVC", sender: self)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .default, title: "Delete") { (action, indexPath) in
            // delete item at indexPath
            
            let item = self.filteredData[indexPath.row]
            self.context.delete(item)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            self.filteredData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
        
        let share = UITableViewRowAction(style: .default, title: "Share") { (action, indexPath) in
            // delete item at indexPath
            
            print("Share")
            
        }
        
        delete.backgroundColor = UIColor(red: 224/255, green: 47/255, blue: 55/255, alpha: 1.0)
        share.backgroundColor = UIColor(red: 47/255, green: 182/255, blue: 224/255, alpha: 1.0)

        
        return [delete,share]
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UpdateVC" {
                let updateVC = segue.destination as! UpdateItemViewController
                updateVC.item = filteredData[selectedIndex!]
            }
        }
    
    
    func createSearchBar() {
        
        let searchBar = UISearchBar()
        searchBar.showsCancelButton = false
        searchBar.placeholder = "Search"
        searchBar.delegate = self
        
        self.navigationItem.titleView = searchBar
        
    }
    
    // This method updates filteredData based on the text in the Search Box
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty {
            filteredData = items
            
        } else {
            
            filteredData = items.filter { ($0.name?.lowercased().contains(searchText.lowercased()))! }
            
        }
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    
}
