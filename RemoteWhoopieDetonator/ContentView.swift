//
//  ContentView.swift
//  RemoteWhoopieDetonator
//
//  Created by Brent Busby on 3/11/23.
//

import SwiftUI
import AVKit
import Subsonic

struct ContentView: View {
    @ObservedObject var model = ViewModelPhone()
    @State var reachable = "No"
    @StateObject private var sound = SubsonicPlayer(sound: "Fart3.m4a")
    @State private var triggerCount = 0
    let allFartSounds = ["Fart.m4a", "Fart.m4a", "Fart.m4a"]
    var body: some View {
        NavigationView {
                Form {
                    Section {
                        Text("Incomplete Tasks:").foregroundColor(.red)
                        Text("Replace Toilet Seat").font(.headline)
                        Text("Buy new underwear").font(.headline)
                        Text("Call Insurance Agent").font(.headline)
                    }
                    
                    Section {
                        Text("Completed Tasks: 32").font(.headline)
                    }.foregroundColor(.green)
                }
                .onReceive(self.model.$fartTrigger) { thing in
                    // triggerCount increment and check used to prevent automatic trigger of sound when app opens
                    if triggerCount > 0 {
                        print(thing)
                        //sound.play()
                        //var randomSound = Int.random(in: 0..<allFartSounds.count)
                        //play(sound: allFartSounds[randomSound])
                    }
                    triggerCount += 1
                }
            .navigationTitle("My Todo List")

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
