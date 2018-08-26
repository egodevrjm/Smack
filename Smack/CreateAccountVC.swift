//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Ryan Morrison on 26/08/2018.
//  Copyright © 2018 Ryan Morrison. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var userImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    //MARK: Buttons
    @IBAction func createAccountPressed(_ sender: Any) {
        guard let email = emailText.text , emailText.text != "" else { return }
        guard let pass = passwordText.text , passwordText.text != "" else { return }
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            if success {
                AuthService.instance.loginUser(email: email, password: pass, completion: { (success) in
                    if success {
                        print("Logged In User!", AuthService.instance.authToken)
                    }
                })
            }
        }
    }
    
    @IBAction func packAvatarPressed(_ sender: Any) {
        
    }
    
    @IBAction func pickBGColorPressed(_ sender: Any) {
        
    }
    
    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    

    
}
