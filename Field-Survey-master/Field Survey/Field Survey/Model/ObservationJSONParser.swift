//
//  ObservationJSONParser.swift
//  Field Survey
//
//  Created by Brian Robinson on 4/14/18.
//  Copyright © 2018 Brian Robinson. All rights reserved.
//

import Foundation

class ObservationJSONParser {
    
    static let dateFormatter = DateFormatter()
    
    class func parse(_ data: Data) -> [Observation] {
        var observations = [Observation]()
        
        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm"
        
        if let json = try? JSONSerialization.jsonObject(with: data, options:[] ),
            let root = json as? [String: Any],
            let status = root["status"] as? String,
            status == "ok" {
            
            if let observationEvents = root["observations"] as? [Any] {
                for someEvent in observationEvents {
                    if let someEvent = someEvent as? [String: String] {
                        if let className = someEvent["classification"],
                        let title = someEvent["title"],
                        let description = someEvent["description"],
                        let dateString = someEvent["date"],
                        let date = dateFormatter.date(from: dateString) {
                            
                            if let observation = Observation(className: className, title: title, description: description, date: date) {
                                observations.append(observation)
                            }
                        }
                    }
                }
            }
        }
        
        return observations
    }
}
