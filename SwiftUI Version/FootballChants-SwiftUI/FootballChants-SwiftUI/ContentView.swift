//
//  ContentView.swift
//  FootballChants-SwiftUI
//
//  Created by Ricardo Camarena on 15/05/23.
//

import SwiftUI

struct ContentView: View {
    
    let team: Team
    
    var body: some View {
        List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
            TeamCardView(team: team)
        }
    }
    
    func greetings() {
        print("Hello, World!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(team: Team.dummyData[0])
    }
}
