//
//  ViewController.swift
//  Risky
//
//  Created by Oscar Chan on 3/31/18.
//  Copyright © 2018 Oscar Chan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBOutlet weak var logout: UIButton!
    
    //
    @IBOutlet weak var Starttime: UITextField!
    
    @IBOutlet weak var Endtime: UITextField!
    
    @IBOutlet weak var finaltime: UILabel!
    
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var riskScore: UITextField!
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Time", Date())
        print("Out")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logout(_ sender: UIButton) {
        if let topController = UIApplication.shared.keyWindow?.rootViewController {
//
//            if let navcontroller = topController.childViewControllers[0] as? UINavigationController{
//                navcontroller.popToRootViewController(animated: false)
//
//                if topController.childViewControllers.count > 0 {
//
//                    for controller in topController.childViewControllers {
//                        controller.removeFromParentViewController()
//                        controller.view.removeFromSuperview()
//                    }
//
//
//                }
//            }
//
            let revealController = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "Login")

            topController.addChildViewController(revealController)
            topController.view.addSubview((revealController.view)!)

        }
        try! Auth.auth().signOut()
        UserDefaults.standard.setValue(nil, forKey: Constants.UserDefaults.currentUser)
    }
    
    
    @IBAction func uploadButton(_ sender: UIButton) {
        ScoreService.upload(username: User.current.username, riskscore: Int(riskScore.text!)!, compltime: (Int(Endtime.text!)! - Int(Starttime.text!)!))
        
    }
    
}

