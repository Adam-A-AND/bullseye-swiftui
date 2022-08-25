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
            .frame(width: 56.0, height: 56.0)
            .overlay(Circle()
                .strokeBorder(Color("ButtonStrokeColour"), lineWidth: 2.0))
    }
}

struct RoundedImageViewFilled: View {
var systemName: String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColour"))
            .frame(width: 56.0, height: 56.0)
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
            .frame(width: 68.0, height: 56.0)
            .foregroundColor(Color("TextColour"))
            .overlay(RoundedRectangle(cornerRadius: 21.0)
                .stroke(lineWidth: 2.0)
                .foregroundColor(Color("ButtonStrokeColour")))
    }
}

struct PreviewView: View {
    var body: some View {
        VStack (spacing: 10.0) {
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
