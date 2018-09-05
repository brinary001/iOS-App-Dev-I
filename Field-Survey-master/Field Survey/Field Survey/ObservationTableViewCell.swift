//
//  ObservationTableViewCell.swift
//  Field Survey
//
//  Created by Brian Robinson on 4/23/18.
//  Copyright © 2018 Brian Robinson. All rights reserved.
//

import UIKit

class ObservationTableViewCell: UITableViewCell {

    @IBOutlet weak var classificationIconImageView: UIImageView!
    
    @IBOutlet weak var animalLabel: UILabel!
    
    @IBOutlet weak var dateTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
