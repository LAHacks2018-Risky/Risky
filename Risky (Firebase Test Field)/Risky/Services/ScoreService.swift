//
//  ScoreService.swift
//  Risky
//
//  Created by Oscar Chan on 3/31/18.
//  Copyright © 2018 Oscar Chan. All rights reserved.
//

import Foundation
import FirebaseAuth.FIRUser
import FirebaseDatabase

struct ScoreService {
    static func show(forUID uid: String, completion: @escaping (Score?) -> Void) {
        let ref = Database.database().reference().child("Results").child(uid)
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            guard let score = Score(snapshot: snapshot) else {
                return completion(nil)
            }
            
            completion(score)
        })
    }
//    static func showleaderboard(forUID uid: String, completion: @escaping (Score?) -> Void) {
//        let ref = Database.database().reference().child("Leaderboards").child(uid)
//        ref.observeSingleEvent(of: .value, with: { (snapshot) in
//            guard let score = Score(snapshot: snapshot) else {
//                return completion(nil)
//            }
//
//            completion(score)
//        })
//    }
    //    static func upload(_ firUser: FIRUser, username: String, riskscore: Int, time: Int, completion: @escaping (Score?) -> Void) {
    //        let userAttrs = ["score": username, "Risk Score": riskscore, "Start Time": time] as [String : Any]
    
    static func upload(username: String, riskscore: Int, tickers: String) {
        let currentUser = User.current
        
        // guard let to unwrap "2nd (user)"
        
        let rootRef = Database.database().reference()
        let newPostRef = rootRef.child("Results").child(currentUser.uid).childByAutoId()
        let newPostKey = newPostRef.key
        
        // 3
        let scoreUpload = ["Username" : username, "Risk Score" : riskscore, "Tickers" : tickers] as [String : Any]
        
        // 4
        let updatedData: [String : Any] = ["Results/\(currentUser.uid)/\(newPostKey)" : scoreUpload]
        
        rootRef.updateChildValues(updatedData)
    }
    
    //        let ref2 = Database.database().reference().child("Leaderboards").child(firUser.uid)
    //        ref2.setValue(userAttrs) { (error, ref2) in
    //            if let error = error {
    //                assertionFailure(error.localizedDescription)
    //                return completion(nil)
    //            }
    //
    //            ref2.observeSingleEvent(of: .value, with: { (snapshot) in
    //                let score = Score(snapshot: snapshot)
    //                completion(score)
    //            })
    //        }
    
    //    }
}

