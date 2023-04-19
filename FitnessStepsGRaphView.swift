//
//  FitnessStepsGRaphView.swift
//  FitnessApp_UI
//
//  Created by Giuseppe, De Masi on 14/03/22.
//

import SwiftUI

struct FitnessStepsGRaphView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Progress")
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            //Bar graph
            ZStack {
               Text("No data could be fetched.")
            }
            .frame(height: 160)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 25)
        .background {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(.ultraThinMaterial)
        }
    }
}

struct FitnessStepsGRaphView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
