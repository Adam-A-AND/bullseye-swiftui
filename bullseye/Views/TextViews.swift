//
//  TextViews.swift
//  bullseye
//
//  Created by Adam Armstrong on 25/08/2022.
//

import SwiftUI

struct ScreenTitleText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .kerning(2.0)
            .font(.title)
            .fontWeight(.black)
            .foregroundColor(Color("TextColour"))
    }
}


struct InstructionText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
            .foregroundColor(Color("TextColour"))
    }
}

struct BigNumberText: View {
    var text: String
    
    var body: some View {
        Text(String(text))
            .kerning(-1.0)
            .font(.largeTitle)
            .fontWeight(.black)
            .foregroundColor(Color("TextColour"))
    }
}

struct SliderLabelText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .foregroundColor(Color("TextColour"))
            .frame(width: 35.0)
    }
}

struct ButtonLabelText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .font(.title3)
    }
}

struct LabelText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .foregroundColor(Color("TextColour"))
            .kerning(1.5)
            .font(.caption)
    }
}

struct AlertBodyText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundColor(Color("TextColour"))
            .multilineTextAlignment(.center)
            .lineSpacing(12.0)
    }
}

struct AlertButtonLabelText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .font(.caption)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.accentColor)
            .foregroundColor(Color.white)
            .cornerRadius(12.0)
    }
}

struct LeaderboardScoreText: View {
    var score: Int
    
    var body: some View {
        Text(String(score))
            .bold()
            .kerning(-0.2)
            .foregroundColor(Color("TextColour"))
            .font(.title3)
    }
}

struct LeaderboardDateText: View {
    var date: Date
    
    var body: some View {
        Text(date, style: .time)
            .bold()
            .kerning(-0.2)
            .foregroundColor(Color("TextColour"))
            .font(.title3)
    }
}



struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ScreenTitleText(text: "Screen Title Text")
            InstructionText(text: "Instructions")
            BigNumberText(text: "Big Number Text")
            SliderLabelText(text: "999")
            ButtonLabelText(text: "Button Label Text")
            LabelText(text: "Label Text")
            AlertBodyText(text: "Alert Body Text")
            AlertButtonLabelText(text: "Alert Button Label Text")
            LeaderboardScoreText(score: 100)
            LeaderboardDateText(date: Date())
        }
    }
}
