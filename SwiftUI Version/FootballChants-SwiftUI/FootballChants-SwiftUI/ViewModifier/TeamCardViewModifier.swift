//
//  TeamCardViewModifier.swift
//  FootballChants-SwiftUI
//
//  Created by Ricardo Camarena on 17/05/23.
//

import SwiftUI

// This entire file creates a modifier to add it to the cards, so we don't type each modifier for every card
struct TeamCardViewModifier: ViewModifier {
    
    let teamType: TeamType
    
    func body(content: Content) -> some View {
        content
            .padding(8)
            .foregroundColor(.white)
            .background(teamType.background)
            .cornerRadius(10)
    }
}

extension View {
    
    func applyTeamCardStyle(teamType: TeamType) -> some View {
        self.modifier(TeamCardViewModifier(teamType: teamType))
    }
}
