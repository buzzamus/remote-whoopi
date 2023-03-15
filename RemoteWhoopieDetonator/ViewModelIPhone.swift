//
//  ViewModelIPhone.swift
//  RemoteWhoopieDetonator
//
//  Created by Brent Busby on 3/12/23.
//

import Foundation
import WatchConnectivity

class ViewModelPhone : NSObject,  WCSessionDelegate, ObservableObject{
    var session: WCSession
    @Published var fartTrigger = false
    init(session: WCSession = .default) {
    self.session = session
    super.init()
    session.delegate = self
    session.activate()
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        print("phone session before art message")
        DispatchQueue.main.async {
            self.fartTrigger = message["message"] as? Bool ?? true
        }
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
}
