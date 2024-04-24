//
//  ContentView.swift
//  Button
//
//  Created by Taylor Shipley on 5/19/23.
//

import SwiftUI

struct ContentView: View {
    @State private var season = "initial"
    
    var body: some View {
        VStack {
            // Text label that displays the season
            Text(season)
                .accessibilityLabel("season")
                .accessibilityValue(season)
            
            // When clicked the text will cycle through the seasons
            Button("Change") {
                switch season {
                case "initial": season = "Winter"
                case "Winter": season = "Spring"
                case "Spring": season = "Summer"
                case "Summer": season = "Fall"
                case "Fall": season = "Winter"
                default: season = "Error unknown case type"
                }
            }
        }
        .padding()
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
