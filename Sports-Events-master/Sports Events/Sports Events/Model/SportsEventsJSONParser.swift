//
//  SportsEventsJSONParser.swift
//  Sports Events
//
//  Created by Brian Robinson on 4/12/18.
//  Copyright © 2018 Brian Robinson. All rights reserved.
//

import Foundation

class SportsEventJSONParser {
    
    static let dateFormatter = DateFormatter()
    
    class func parse(_ data: Data) -> [SportsEvent] {
        var sportsEvents = [SportsEvent]()
        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm"
        
        if let json = try? JSONSerialization.jsonObject(with: data, options: []),
            let root = json as? [String: Any],
            let status = root["status"] as? String,
            status == "ok" {
            
            if let events = root["events"] as? [Any] {
                for event in events {
                    if let event = event as? [String: String] {
                         if let sportName = event["sport"],
                            let matchup = event["matchup"],
                            let dateString = event["date"],
                            let date = dateFormatter.date(from: dateString) {
                            
                            if let sportsEvent = SportsEvent(sportName: sportName, matchup: matchup, date: date) {
                                sportsEvents.append(sportsEvent)
                            }
                    }
                }
            }
            
        }
            

        }
        return sportsEvents
    }

}
