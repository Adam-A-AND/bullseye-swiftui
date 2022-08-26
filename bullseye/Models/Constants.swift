//
//  Constants.swift
//  bullseye
//
//  Created by Adam Armstrong on 25/08/2022.
//

import Foundation
import UIKit

enum Constants {
    enum General {
        public static let strokeWidth = CGFloat(2.0)
        public static let roundViewLength = CGFloat(56.0)
        public static let roundRectViewWidth = CGFloat(68.0)
        public static let roundRectViewHeight = CGFloat(56.0)
        public static let roundedRectCornerRadius = CGFloat(21.0)
        public static let vstackSpacing = Double(10.0)
    }
    
    enum DeviceSetup {
        enum Landscape {
            public static let width = CGFloat(568)
            public static let height = CGFloat(320)
        }
    }
    
    enum Leaderboard {
        public static let scoreColumnWidth = CGFloat(50.0)
        public static let dateColumnWidth = CGFloat(170.0)
        public static let maxRowWidth = CGFloat(480.0)
    }
}
