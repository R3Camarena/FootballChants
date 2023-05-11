//
//  Manager.swift
//  Football Chants
//
//  Created by Ricardo Camarena on 10/05/23.
//

import Foundation

enum JobType: String {
    case manager = "Manager"
    case headCoach = "Head Coach"
}

struct Manager {
    let name: String
    let job: JobType
}
