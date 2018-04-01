//
//  Score.swift
//  Risky
//
//  Created by Oscar Chan on 3/31/18.
//  Copyright © 2018 Oscar Chan. All rights reserved.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot

class Score: NSObject {
    
    // MARK: - Properties
    
    var score: String
    var starttime = Date()
    var endtime = Date()
    var riskscore: Int
    var finaltime: Int
    
    // 1
    private static var _current: Score?
    
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
            let score = dict["Score"] as? String,
            let starttime = dict["Start Time"] as? Date,
            let endtime = dict["End Time"] as? Date,
            let riskscore = dict["Risk Score"] as? Int,
            let finaltime = dict["Final Time"] as? Int
            else { return nil }
        
        self.score = score
        self.starttime = starttime
        self.endtime = endtime
        self.riskscore = riskscore
        self.finaltime = finaltime
    }
    
    init(score: String, starttime: Date, endtime: Date, riskscore: Int, finaltime: Int) {
        self.score = score
        self.starttime = starttime
        self.endtime = endtime
        self.riskscore = riskscore
        self.finaltime = finaltime
    }
}
