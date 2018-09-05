//
//  ObservationJSONLoader.swift
//  Field Survey
//
//  Created by Brian Robinson on 4/14/18.
//  Copyright © 2018 Brian Robinson. All rights reserved.
//

import Foundation

class ObservationJSONLoader {
    class func load(fileName: String) -> [Observation] {
        var observations = [Observation]()
        
        if let path = Bundle.main.path(forResource: fileName, ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
             observations = ObservationJSONParser.parse(data)
        }
        return observations
    }
}
