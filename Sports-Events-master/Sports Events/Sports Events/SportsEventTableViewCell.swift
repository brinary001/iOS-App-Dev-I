//
//  SportsEventTableViewCell.swift
//  Sports Events
//
//  Created by Brian Robinson on 4/13/18.
//  Copyright © 2018 Brian Robinson. All rights reserved.
//

import UIKit

class SportsEventTableViewCell: UITableViewCell {
    @IBOutlet weak var sportIconImageView: UIImageView!
    @IBOutlet weak var matchupLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
