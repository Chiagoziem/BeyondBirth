//
//  LoggedInUser.swift
//  BeyondBirth
//
//  Created by Jordan George on 10/26/18.
//  Copyright © 2018 Jordan George. All rights reserved.
//

import Foundation

// model for the logged in user
class LoggedInUser: NSObject {
    var email: String?
    var name: String?
    
    init(email: String, name: String) {
        self.email = email
        self.name = name
    }
}
