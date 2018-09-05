//
//  ItemsViewController.swift
//  Core Data App
//
//  Created by Brian Robinson on 5/8/18.
//  Copyright © 2018 Brian Robinson. All rights reserved.
//

import UIKit

class ItemsViewController: UIViewController {
    
    @IBOutlet weak var itemsTableView: UITableView!
    
    let dateFormatter = DateFormatter()

    var location: Location? 

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.timeStyle = .long
        dateFormatter.dateStyle = .long
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.itemsTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addNewItem(_ sender: Any) {
        performSegue(withIdentifier: "showItem", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? NewItemViewController else {
            return
        }
        
        destination.location = location
    }
    
    func deleteItem(at indexPath: IndexPath) {
        guard let item = location?.items?[indexPath.row],
            let managedContext = item.managedObjectContext else {
                return
        }
        
        managedContext.delete(item)
        
        do {
            try managedContext.save()
            
            itemsTableView.deleteRows(at: [indexPath], with: .automatic)
        } catch {
            print("Could not delete item")
            
            itemsTableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
}
    
    extension ItemsViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return location?.items?.count ?? 0
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = itemsTableView.dequeueReusableCell(withIdentifier: "expenseCell", for: indexPath)
            if let item = location?.items?[indexPath.row] {
                cell.textLabel?.text = item.name
                
                if let date = item.dateAdded {
                    cell.detailTextLabel?.text = dateFormatter.string(from: date as Date)
                    
                }
            }
            return cell
        }
        
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                deleteItem(at: indexPath)
            }
        }
    }
    
    extension ItemsViewController: UITableViewDelegate {
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            performSegue(withIdentifier: "showItem", sender: self)
        }
    }

