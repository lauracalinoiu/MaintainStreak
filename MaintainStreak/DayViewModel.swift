//
//  DayViewModel.swift
//  MaintainStreak
//
//  Created by Laura Calinoiu on 24/04/2017.
//  Copyright © 2017 Laura Calinoiu. All rights reserved.
//

import Foundation

class DayViewModel {
    
    var date: Date
    var events: [EventViewModel] = []
    
    var day: Day!
    
    init(_ day: Day) {
        self.day = day
        date = day.date
        guard let allEvents = day.events else { return }
        for event in allEvents {
            events.append(EventViewModel(event as! Event))
        }
    }
}
