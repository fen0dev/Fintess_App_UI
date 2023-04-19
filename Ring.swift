//
//  Ring.swift
//  FitnessApp_UI
//
//  Created by Giuseppe, De Masi on 14/03/22.
//

import SwiftUI

struct Ring: Identifiable {
    var id = UUID().uuidString
    var progress: CGFloat
    var value: String
    var keyIcon: String
    var keyColor: Color
    var isText: Bool = false
}

var rings: [Ring] = [

    Ring(progress: 72, value: "Steps", keyIcon: "figure.walk", keyColor: Color("green")),
    Ring(progress: 36, value: "Calories", keyIcon: "flame.fill", keyColor: Color("red")),
    Ring(progress: 91, value: "Sleep Time", keyIcon: "alarm.fill", keyColor: Color("purple"), isText: true)

]
