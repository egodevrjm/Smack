//
//  LoginVC.swift
//  Smack
//
//  Created by Ryan Morrison on 26/08/2018.
//  Copyright © 2018 Ryan Morrison. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    //MARK: Variables
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    @IBAction func closePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createAccountPressed(_ sender: Any){
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        spinner.isHidden = false
        spinner.startAnimating()
        
        guard let email = usernameText.text , usernameText.text != "" else { return }
        guard let password = passwordText.text , passwordText.text != "" else { return }
        AuthService.instance.loginUser(email: email, password: password) { (success) in
            if success {
                AuthService.instance.findUserByEmail(completion: { (success) in
                    if success {
                        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                        self.spinner.isHidden = true
                        self.spinner.stopAnimating()
                        self.dismiss(animated: true, completion: nil)
                    }
                })
            }
        }
    }
    
    func setupView() {
        spinner.isHidden = true
        
        usernameText.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedString.Key.foregroundColor: BUZZ_RED_PLACEHOLDER])
        passwordText.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedString.Key.foregroundColor: BUZZ_RED_PLACEHOLDER])
    }

}
