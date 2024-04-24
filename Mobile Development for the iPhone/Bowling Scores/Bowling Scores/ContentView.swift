//
//  ContentView.swift
//  Bowling Scores
//
//  Created by Taylor Shipley on 6/1/23.
//

import SwiftUI

struct ContentView: View {
    @State private var game1input = ""
    @State private var game2input = ""
    @State private var game3input = ""
    @State private var seriesValue = "0"
    @State private var avgValue = "0"
    @State private var highValue = "0"
    
    var body: some View {
        VStack {
            HStack{
                Text("Game 1")
                    .frame(width: /*@START_MENU_TOKEN@*/180.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                    .background(.yellow)
                    .accessibilityLabel("game1label")
                    .accessibilityValue("Game 1")
                
                TextField("0", text: $game1input)
                    .background(.blue)
                    .accessibilityLabel("game1")
                    .accessibilityValue(game1input)
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
            }
            
            HStack{
                Text("Game 2")
                    .frame(width: /*@START_MENU_TOKEN@*/180.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                    .background(.yellow)
                    .accessibilityLabel("game2label")
                    .accessibilityValue("Game 2")
                TextField("0", text: $game2input)
                    .background(.blue)
                    .accessibilityLabel("game2")
                    .accessibilityValue(game2input)
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
            }
            HStack{
                Text("Game 3")
                    .frame(width: /*@START_MENU_TOKEN@*/180.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                    .accessibilityLabel("game3label")
                    .accessibilityValue("Game 3")
                    .background(.yellow)
                TextField("0", text: $game3input)
                    .background(.blue)
                    .accessibilityLabel("game3")
                    .accessibilityValue(game3input)
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            // MARK: Calculate Button
            VStack{
                Button("Calculate"){
                    let score1 = Int(game1input) ?? 0
                    let score2 = Int(game2input) ?? 0
                    let score3 = Int(game3input) ?? 0
                    let series = calcSeries(score1: score1, score2: score2, score3: score3)
                    let avg = calcAvg(score1: score1, score2: score2, score3: score3)
                    let high = calcHigh(score1: score1, score2: score2, score3: score3)
                    
                    seriesValue = String(series)
                    avgValue = String(avg)
                    highValue = String(high)
                    
                }
                .frame(width: /*@START_MENU_TOKEN@*/360.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                .background(.green)
                .accessibilityLabel("calculate")
                .accessibilityValue("Calculate")
            }
            HStack{
                Text("Series")
                    .frame(width: /*@START_MENU_TOKEN@*/180.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                    .background(.yellow)
                    .accessibilityLabel("serieslabel")
                    .accessibilityValue("Series")
                Text(seriesValue)
                    .frame(width: /*@START_MENU_TOKEN@*/180.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                    .background(.blue)
                    .accessibilityLabel("series")
                    .accessibilityValue(seriesValue)
                
            }
            HStack{
                Text("Average")
                    .frame(width: /*@START_MENU_TOKEN@*/180.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                    .background(.yellow)
                    .accessibilityLabel("averagelabel")
                    .accessibilityValue("Average")
                Text(avgValue)
                    .frame(width: /*@START_MENU_TOKEN@*/180.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                    .background(.blue)
                    .accessibilityLabel("average")
                    .accessibilityValue(avgValue)
            }
            HStack{
                Text("High")
                    .frame(width: /*@START_MENU_TOKEN@*/180.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                    .background(.yellow)
                    .accessibilityLabel("highlabel")
                    .accessibilityValue("High")
                Text(highValue)
                    .frame(width: /*@START_MENU_TOKEN@*/180.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                    .background(.blue)
                    .accessibilityLabel("high")
                    .accessibilityValue(highValue)
            }
            Spacer()
        }
        .padding()
    }
    // MARK: Funtions
    func calcSeries(score1: Int, score2: Int, score3: Int) -> Int {
        return score1 + score2 + score3
    }
    
    func calcAvg(score1: Int, score2: Int, score3: Int) -> Int {
        let numGames = [score1, score2, score3].filter { $0 != 0 }.count
        if (numGames == 0){
            return 0
        }
        return (score1 + score2 + score3)/numGames
    }
    
    func calcHigh(score1: Int, score2: Int, score3: Int) -> Int {
        var highestScore = score1
        if (highestScore < score2){
            highestScore = score2
        }
        if (highestScore < score3){
            highestScore = score3
        }
        return highestScore
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
