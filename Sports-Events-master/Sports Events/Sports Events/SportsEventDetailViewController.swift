//
//  SportsEventDetailViewController.swift
//  Sports Events
//
//  Created by Brian Robinson on 4/13/18.
//  Copyright © 2018 Brian Robinson. All rights reserved.
//

import UIKit

class SportsEventDetailViewController: UIViewController {

    var sportsEvent: SportsEvent?
    
    var dateFormatter = DateFormatter()
    
    @IBOutlet var sportIconImageView: UIImageView!
    @IBOutlet weak var matchupLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Event"
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        
        if let date = sportsEvent?.date {
            dateLabel.text = dateFormatter.string(from: date)
        } else {
            dateLabel.text = ""
        }
        
        sportIconImageView.image = sportsEvent?.sport.image
        matchupLabel.text = sportsEvent?.matchup
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
