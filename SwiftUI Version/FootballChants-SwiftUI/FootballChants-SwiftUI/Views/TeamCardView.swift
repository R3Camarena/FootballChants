//
//  TeamCardView.swift
//  FootballChants-SwiftUI
//
//  Created by Ricardo Camarena on 17/05/23.
//

import SwiftUI

struct TeamCardView: View {
    
    let team: Team
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack(alignment: .top, spacing: 20) {
                
                // Badge image
                Image(team.id.badge)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .accessibilityLabel(Text("\(team.name) badge"))
                
                VStack(alignment: .leading, spacing: 5) {
                    
                    // Team name text
                    Text(team.name)
                        .font(.system(size: 18, weight: .bold))
                        .accessibilityLabel(Text("Team Name"))
                        .accessibilityValue(Text(team.name))
                    
                    // Founded date text
                    Text("Founded: \(team.founded)")
                        .font(.system(size: 12, weight: .light))
                        .accessibilityLabel(Text("Team Founded"))
                        .accessibilityValue(Text(team.founded))
                    
                    // Job type text
                    Text("Current \(team.manager.job.rawValue): \(team.manager.name)")
                        .font(.system(size: 10, weight: .light))
                        .accessibilityLabel(Text("\(team.manager.job.rawValue)"))
                        .accessibilityValue(Text(team.manager.name))
                    
                    // full information text
                    Text(team.info)
                        .font(.system(size: 12, weight: .medium))
                        .accessibilityLabel(Text("Team Information"))
                        .accessibilityValue(Text(team.info))
                }
                
                Spacer()
                
                // Play button
                Button(action: {}, label: {
                    
                    Image(systemName: "play.circle.fill")
                        .resizable()
                        .scaledToFit()
                })
                .frame(maxWidth: 40, maxHeight: .infinity, alignment: .center)
                .accessibilityElement(children: .ignore)
                .accessibilityValue(Text(team.isPlaying ? "False" :  "Play"))
            }
        }
        .applyTeamCardStyle(teamType: team.id)
    }
}

struct TeamCardView_Previews: PreviewProvider {
    static var previews: some View {
        TeamCardView(team: Team.dummyData[0])
            .previewLayout(.fixed(width: 400, height: 150))
            .padding()
            .previewDisplayName("Dummy Data 1: Team Card Preview")
        TeamCardView(team: Team.dummyData[1])
            .previewLayout(.fixed(width: 400, height: 150))
            .padding()
            .previewDisplayName("Dummy data 2: Team Card Preview")
    }
}
