//
//  SportsEventsJSONLoader.swift
//  Sports Events
//
//  Created by Brian Robinson on 4/12/18.
//  Copyright © 2018 Brian Robinson. All rights reserved.
//

import Foundation

class SportsEventsJSONLoader {
    
    class func load(fileName: String) -> [SportsEvent] {
        var events = [SportsEvent]()
        
        if let path = Bundle.main.path(forResource: fileName, ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
              events = SportsEventJSONParser.parse(data)
        }
        return events
    }
}
