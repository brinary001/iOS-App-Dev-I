//
//  UpdateValue.swift
//  Conversion Calculator
//
//  Created by Brian Robinson on 5/8/18.
//  Copyright © 2018 Brian Robinson. All rights reserved.
//

import Foundation

struct UpdateValue {
    let initialValue: String
    let computedValue: String
    init(initialValue: String, computedValue: String) {
        self.initialValue = initialValue
        self.computedValue = computedValue
    }
}
