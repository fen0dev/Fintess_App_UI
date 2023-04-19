//
//  Steps.swift
//  FitnessApp_UI
//
//  Created by Giuseppe, De Masi on 14/03/22.
//

import SwiftUI

struct Steps: Identifiable {
    var id = UUID().uuidString
    var value: CGFloat
    var key: String
    var color: Color = Color("purple")
}

var steps: [Steps] = [

    Steps(value: 500, key: "1-4 AM"),
    Steps(value: 240, key: "5-8 AM", color: Color("green")),
    Steps(value: 350, key: "9-11 AM"),
    Steps(value: 430, key: "12-4 PM", color: Color("green")), 
    Steps(value: 690, key: "5-8 AM"),
    Steps(value: 540, key: "9-12 AM", color: Color("green"))
    
]
