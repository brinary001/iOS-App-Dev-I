//
//  Sport.swift
//  Sports Events
//
//  Created by Brian Robinson on 4/10/18.
//  Copyright © 2018 Brian Robinson. All rights reserved.
//

import UIKit

enum Sport: String {
    case baseball
    case basketball
    case football
    case hockey
    case soccer
    
    var image: UIImage? {
        return UIImage(named: self.rawValue + "Icon")
    }

}

