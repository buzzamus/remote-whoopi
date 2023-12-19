//
//  ViewModelWatch.swift
//  RemoteWhoopieDetonator Watch App
//
//  Created by Brent Busby on 3/12/23.
//

import Foundation
import WatchConnectivity

class SessionDelegate : NSObject,  WCSessionDelegate{
    var session: WCSession
    init(session: WCSession = .default) {
    self.session = session
        super.init()
        session.delegate = self
        session.activate()
    }
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("watch session initiated....")
        
    }
    
}
