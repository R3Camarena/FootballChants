//
//  Manager.swift
//  Football Chants
//
//  Created by Ricardo Camarena on 10/05/23.
//

import Foundation

enum JobType {
    case manager
    case headCoach
}

struct Manager {
    let name: String
    let job: JobType
}
