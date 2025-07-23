//
//  Sign.swift
//  RPS
//
//  Created by Zheng Liu on 7/23/25.
//

import Foundation
enum Sign {
    case rock
    case paper
    case scissors
    
    // computed property to get the string representation of the sign
    var emoji: String {
        switch self {
        case .rock:
            return "✊"
        case .paper:
            return "✋"
        case .scissors:
            return "✌️"
        }
    }
    
    // compare two signs and return the game state
    func compare(with other: Sign) -> GameState {
        if self == other {
            return .draw
        } else if (self == .rock && other == .scissors) ||
                    (self == .paper && other == .rock) ||
                    (self == .scissors && other == .paper) {
            return .win
        } else {
            return .lose
        }
    }
}

func randomSign() -> Sign {
    let sign = Int.random(in: 0...2)
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}
