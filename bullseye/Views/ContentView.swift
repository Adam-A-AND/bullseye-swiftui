//
//  ContentView.swift
//  bullseye
//
//  Created by Adam Armstrong on 23/08/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    var body: some View {
        ZStack {
            BackgroundView(game: $game)
            VStack {
                InstructionView(game: $game)
                    .padding(.bottom, alertIsVisible ? 0 : 100)
                if alertIsVisible {
                    PointsView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
                        .transition(.scale)
                } else {
                    HitMeButtonView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
                        .transition(.scale)
                }
            }
            if !alertIsVisible {
                SliderView(sliderValue: $sliderValue)
                    .transition(.scale)
            }
        }
    }
}

struct InstructionView: View {
    @Binding var game: Game
    
    var body: some View {
        VStack {
            InstructionText(text: "🎯🎯🎯\nPut the bullseye as close as you can to")
                .padding(.horizontal, 30.0)
            BigNumberText(text: String(game.target))
        }
    }
}

struct SliderView: View {
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack {
            SliderLabelText(text: "1")
            Slider(value: $sliderValue, in: 1.0...100.0)
            SliderLabelText(text: "100")
        }
    }
}

struct HitMeButtonView: View {
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game

    var body: some View {
        Button(action: {
            withAnimation {
                alertIsVisible = true
            }
        }) {
            ButtonLabelText(text: "Hit Me")
        }
        .padding(20.0)
        .background(ZStack {
            Color("ButtonColour")
            LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
        })
        .foregroundColor(.white)
        .cornerRadius(Constants.General.roundedRectCornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: Constants.General.roundedRectCornerRadius).strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth)
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView().previewLayout(.fixed(width: Constants.DeviceSetup.Landscape.width, height: Constants.DeviceSetup.Landscape.height))
        ContentView()
            .preferredColorScheme(.dark)
        ContentView().preferredColorScheme(.dark).previewLayout(.fixed(width: Constants.DeviceSetup.Landscape.width, height: Constants.DeviceSetup.Landscape.height))
    }
}
