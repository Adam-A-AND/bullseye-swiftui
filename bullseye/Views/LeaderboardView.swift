//
//  LeaderboardView.swift
//  bullseye
//
//  Created by Adam Armstrong on 26/08/2022.
//

import SwiftUI

struct LeaderboardView: View {
    @Binding var leaderboardIsShowing: Bool
    @Binding var game: Game
    
    var body: some View {
        ZStack {
            Color("BackgroundColoud")
                .edgesIgnoringSafeArea(.all)
            VStack {
                HeaderView(leaderboardIsShowing: $leaderboardIsShowing)
                ColumnHeaderView()
                ScrollView { VStack (spacing: Constants.General.vstackSpacing) {
                    ForEach(game.leaderboardEntries.indices, id: \.self) { i in
                        let leaderboardEntry = game.leaderboardEntries[i]
                        
                        RowView(index: i, score: leaderboardEntry.score, date: leaderboardEntry.date)
                    }
                }
                }
            }
        }
    }
}

struct HeaderView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    @Binding var leaderboardIsShowing: Bool
    
    var body: some View {
        ZStack {
            HStack {
                if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                    ScreenTitleText(text: "Leaderboard")
                        .padding(.leading)
                    Spacer()
                } else {
                    ScreenTitleText(text: "Leaderboard")
                }
            }
            HStack {
                Spacer()
                Button(action: {
                    leaderboardIsShowing = false
                }) {
                    RoundedImageViewFilled(systemName: "xmark")
                    .padding(.trailing)
                }
            }
        }
        .padding()
    }
}

struct ColumnHeaderView: View {
    var body: some View {
        HStack {
            Spacer()
                .frame(width: Constants.General.roundViewLength)
            Spacer()
            LabelText(text: "Score")
                .frame(width: Constants.Leaderboard.scoreColumnWidth)
            Spacer()
            LabelText(text: "Date")
                .frame(width: Constants.Leaderboard.dateColumnWidth)
        }
        .padding(.horizontal)
        .frame(maxWidth: Constants.Leaderboard.maxRowWidth)
    }
}

struct RowView: View {
    let index: Int
    let score: Int
    let date: Date
    
    var body: some View {
        HStack {
            RoundedTextView(text: String(index))
            Spacer()
            LeaderboardScoreText(score: score)
                .frame(width: Constants.Leaderboard.scoreColumnWidth)
            Spacer()
            LeaderboardDateText(date: date)
                .frame(width: Constants.Leaderboard.dateColumnWidth)
        }
        .background(
            RoundedRectangle(cornerRadius: .infinity)
                .strokeBorder(Color("LeaderboardRowColour"), lineWidth: Constants.General.strokeWidth)
        )
        .padding(.horizontal)
        .frame(maxWidth: Constants.Leaderboard.maxRowWidth)
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static private var leaderboardIsShowing = Binding.constant(false)
    static private var game = Binding.constant(Game(loadTestData: true))
    
    static var previews: some View {
        LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
        LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game).previewLayout(.fixed(width: Constants.DeviceSetup.Landscape.width, height: Constants.DeviceSetup.Landscape.height))
    }
}
