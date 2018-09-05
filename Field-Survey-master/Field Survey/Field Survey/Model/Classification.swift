//
//  Classification.swift
//  Field Survey
//
//  Created by Brian Robinson on 4/13/18.
//  Copyright © 2018 Brian Robinson. All rights reserved.
//

import Foundation
import UIKit

enum Classification: String {
    case amphibian
    case bird
    case fish
    case insect
    case mammal
    case plant
    case reptile
    
    var image: UIImage? {
        return UIImage(named: self.rawValue + "Icon")
    }
    
}
