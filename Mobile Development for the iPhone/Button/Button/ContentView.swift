//
//  ContentView.swift
//  Button
//
//  Created by Taylor Shipley on 5/19/23.
//

import SwiftUI

struct ContentView: View {
    @State private var season = "Initial"
    //added change to allow push
    var body: some View {
        VStack {
            // Text label that displays the season
            Text(season)
                .accessibilityLabel("season")
                .accessibilityValue(season)
            
            // When clicked the text will cycle through the seasons in order.
            Button("Change") {
                switch season {
                case "Initial": season = "Winter"
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
