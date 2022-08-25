//
//  RoundViews.swift
//  bullseye
//
//  Created by Adam Armstrong on 25/08/2022.
//

import SwiftUI

struct RoundedImageViewStroked: View {
var systemName: String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("TextColour"))
            .frame(width: Constants.General.roundViewLength, height: Constants.General.roundViewLength)
            .overlay(Circle()
                .strokeBorder(Color("ButtonStrokeColour"), lineWidth: Constants.General.strokeWidth))
    }
}

struct RoundedImageViewFilled: View {
var systemName: String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColour"))
            .frame(width: Constants.General.roundViewLength, height: Constants.General.roundViewLength)
            .background(Circle()
                .fill(Color("ButtonFilledBackgroundColour")))
    }
}

struct RoundedRectTextView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .kerning(-0.2)
            .bold()
            .font(.title3)
            .frame(width: Constants.General.roundRectViewWidth, height: Constants.General.roundRectViewHeight)
            .foregroundColor(Color("TextColour"))
            .overlay(RoundedRectangle(cornerRadius: Constants.General.roundedRectCornerRadius)
                .stroke(lineWidth: Constants.General.strokeWidth)
                .foregroundColor(Color("ButtonStrokeColour")))
    }
}

struct PreviewView: View {
    var body: some View {
        VStack (spacing: Constants.General.vstackSpacing) {
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            RoundedImageViewFilled(systemName: "arrow.counterclockwise")
            RoundedRectTextView(text: "100")
        }
    }
}

struct RoundViews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView()
        PreviewView().preferredColorScheme(.dark)
    }
}
