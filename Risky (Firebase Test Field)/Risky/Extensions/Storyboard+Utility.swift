//
//  Storyboard+Utility.swift
//  Risky
//
//  Created by Oscar Chan on 3/31/18.
//  Copyright © 2018 Oscar Chan. All rights reserved.
//

import UIKit

extension UIStoryboard {
    enum MGType: String {   //Change MG to R
        case main
        case login
        
        var filename: String {
            return rawValue.capitalized
        }
    }
    
    convenience init(type: MGType, bundle: Bundle? = nil) {
        self.init(name: type.filename, bundle: bundle)
    }
    
    static func initialViewController(for type: MGType) -> UIViewController {
        let storyboard = UIStoryboard(type: type)
        guard let initialViewController = storyboard.instantiateInitialViewController() else {
            fatalError("Couldn't instantiate initial view controller for \(type.filename) storyboard.")
        }
        
        return initialViewController
    }
    
}
