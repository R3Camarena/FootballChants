//
//  Manager.swift
//  FootballChants-SwiftUI
//
//  Created by Ricardo Camarena on 16/05/23.
//

import Foundation

enum Job: String {
    case manager = "Manager"
    case headCoach = "Head Coach"
}

struct Manager {
    let name: String
    let job: Job
}
