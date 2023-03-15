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
    @StateObject private var sound = SubsonicPlayer(sound: "Fart.m4a")
    @State private var triggerCount = 0
    var body: some View {
        ZStack {
            VStack {
                Text("Reachable \(reachable)")
                
                Text(String(self.model.fartTrigger))

                 Button(action: {
                     if self.model.session.isReachable{
                         self.reachable = "Yes"
                     }
                     else{
                         self.reachable = "No"
                     }
                     
                 }) {
                     Text("Update")
                 }
            }
            .padding()
        }.onReceive(self.model.$fartTrigger) { thing in
            // triggerCount increment and check used to prevent automatic trigger of sound when app opens
            if triggerCount > 0 {
                print(thing)
                sound.play()
            }
            triggerCount += 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
