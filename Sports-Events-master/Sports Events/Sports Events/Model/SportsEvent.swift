//
//  SportsEvent.swift
//  Sports Events
//
//  Created by Brian Robinson on 4/10/18.
//  Copyright © 2018 Brian Robinson. All rights reserved.
//

import Foundation
import UIKit

struct SportsEvent {
    let sport: Sport
    let matchup: String
    let date: Date
    
    init(sport: Sport, matchup: String, date: Date) {
        self.sport = sport
        self.matchup = matchup
        self.date = date
    }
    
    init?(sportName: String, matchup: String, date: Date) {
        if let sport = Sport(rawValue: sportName) {
            self.init(sport: sport, matchup: matchup, date: date)
        } else {
            return nil
        }
    }
}
