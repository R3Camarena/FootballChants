//
//  FootballChants_SwiftUIApp.swift
//  FootballChants-SwiftUI
//
//  Created by Ricardo Camarena on 15/05/23.
//

import SwiftUI

@main
struct FootballChants_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(team: Team.dummyData[0])
        }
    }
}
