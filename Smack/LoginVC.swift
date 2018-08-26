//
//  LoginVC.swift
//  Smack
//
//  Created by Ryan Morrison on 26/08/2018.
//  Copyright © 2018 Ryan Morrison. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    //MARK: Variables
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func closePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createAccountPressed(_ sender: Any){
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }

}
