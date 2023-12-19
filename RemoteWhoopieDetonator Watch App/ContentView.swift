//
//  ContentView.swift
//  RemoteWhoopieDetonator Watch App
//
//  Created by Brent Busby on 3/11/23.
//

import SwiftUI
import WatchConnectivity

struct ContentView: View {
    var sessionDelegate = SessionDelegate()
    @State var fartTrigger = false
    var body: some View {
        VStack {
            Button {
                print("Clicking button...")
                triggerFart()
            } label: {
                Text("Detonate Fart")
                    .font(.headline)
            }
            .clipShape(Capsule())
            .background(.red)
            .cornerRadius(30)
            
        }
        .padding()
    }
    
    func triggerFart() {
        print("triggered fart called...")
        fartTrigger = true
        self.sessionDelegate.session.sendMessage(["message" : self.fartTrigger], replyHandler: nil) { (error) in
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
