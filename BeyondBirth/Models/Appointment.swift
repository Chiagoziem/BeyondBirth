//
//  Appointment.swift
//  BeyondBirth
//
//  Created by Jordan George on 10/30/18.
//  Copyright © 2018 Jordan George. All rights reserved.
//

import Foundation

// model for appointments
class Appointment: NSObject {
    var key: String?
    var name: String?
    var dateString: String?
    var date: String?
    var notes: String?
    
    init(key: String, name: String, dateString: String, date: String, notes: String) {
        self.key = key
        self.name = name
        self.dateString = dateString
        self.date = date
        self.notes = notes
    }
}
