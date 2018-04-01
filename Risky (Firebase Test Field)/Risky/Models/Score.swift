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
    
    var riskscore: Int
    var ticker: String
    
    // 1
    private static var _current: Score?
    
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
            let riskscore = dict["Risk Score"] as? Int,
            let ticker = dict["Ticker"] as? String
            else { return nil }
        
        self.riskscore = riskscore
        self.ticker = ticker
    }
    
    init(score: String, starttime: Date, endtime: Date, riskscore: Int, ticker: String) {
        self.riskscore = riskscore
        self.ticker = ticker
    }
}
