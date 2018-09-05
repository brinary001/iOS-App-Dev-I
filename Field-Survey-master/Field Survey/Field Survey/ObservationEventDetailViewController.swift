//
//  ObservationEventDetailViewController.swift
//  Field Survey
//
//  Created by Brian Robinson on 4/22/18.
//  Copyright © 2018 Brian Robinson. All rights reserved.
//

import UIKit

class ObservationEventDetailViewController: UIViewController {

    var observation: Observation?
    
    var dateFormatter = DateFormatter()
    
    @IBOutlet weak var classificationIconImageView: UIImageView!
    @IBOutlet weak var animalLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Observation"
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium

        classificationIconImageView.image = observation?.classification.image
        animalLabel.text = observation?.title
        descriptionLabel.text = observation?.description
        
        if let date = observation?.date {
            dateTimeLabel.text = dateFormatter.string(from: date)
        } else {
            dateTimeLabel.text = ""
        }
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
