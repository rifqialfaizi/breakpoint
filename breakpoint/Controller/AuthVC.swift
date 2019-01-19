//
//  AuthVC.swift
//  breakpoint
//
//  Created by Rifqi Alfaizi on 01/01/19.
//  Copyright © 2019 Rifqi Alfaizi. All rights reserved.
//

import UIKit
import Firebase

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Auth.auth().currentUser != nil {
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func signInWithEmailBtnWasPressed(_ sender: Any) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        
        present(loginVC!, animated: true, completion: nil)
    }
    
    @IBAction func facebookSignInBtnWasPressed(_ sender: Any) {
    }
    @IBAction func googleSignInBtnWasPressed(_ sender: Any) {
    }
}
