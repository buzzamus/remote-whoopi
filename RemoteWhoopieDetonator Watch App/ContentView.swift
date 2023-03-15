//
//  ContentView.swift
//  RemoteWhoopieDetonator Watch App
//
//  Created by Brent Busby on 3/11/23.
//

import SwiftUI
import WatchConnectivity

struct ContentView: View {
    var model = ViewModelWatch()
    @State var fartTrigger = false
    var body: some View {
        VStack {
            Button("Detonate") {
                print("Clicking button...")
                triggerFart()
            }
            .foregroundColor(.white)
            .background(.red)
            .cornerRadius(30)
            
        }
        .padding()
    }
    
    func triggerFart() {
        print("triggered fart called...")
        fartTrigger = true
        self.model.session.sendMessage(["message" : self.fartTrigger], replyHandler: nil) { (error) in
            print(error.localizedDescription)
            print("Past send message")
        }
        fartTrigger = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
