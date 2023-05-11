//
//  Team.swift
//  Football Chants
//
//  Created by Ricardo Camarena on 10/05/23.
//

import Foundation

struct Team {
    let id: TeamType
    let name: String
    let info: String
    let manager: Manager
    let founded: String
    var isPlaying: Bool = false
}
