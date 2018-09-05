//
//  LocationsViewController.swift
//  Core Data App
//
//  Created by Brian Robinson on 5/8/18.
//  Copyright © 2018 Brian Robinson. All rights reserved.
//

import UIKit
import CoreData

class LocationsViewController: UIViewController {

    @IBOutlet weak var locationsTableView: UITableView!

    var locations: [Location] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Location> = Location.fetchRequest()
        
        do {
           locations = try managedContext.fetch(fetchRequest)
            
            locationsTableView.reloadData()
        } catch {
            print("Could not fetch")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? LocationsViewController,
            let selectedRow = self.locationsTableView.indexPathForSelectedRow?.row else {
                return
            }
        
        destination.locations = [locations[selectedRow]]
        }
    
    func deleteLocation(at indexPath: IndexPath) {
        let location = locations[indexPath.row]
        
        guard let managedContext = location.managedObjectContext else {
            return
        }
        
        managedContext.delete(location)
        
        do {
            try managedContext.save()
            
            locations.remove(at: indexPath.row)
            
            locationsTableView.deleteRows(at: [indexPath], with: .automatic)
        } catch {
            print("Could not delete")
            
            locationsTableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
}


extension LocationsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = locationsTableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath)
        let location = locations[indexPath.row]
        
        cell.textLabel?.text = location.title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteLocation(at: indexPath)
        }
    }
}
