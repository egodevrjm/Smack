//
//  ChannelVC.swift
//  Smack
//
//  Created by Ryan Morrison on 26/08/2018.
//  Copyright © 2018 Ryan Morrison. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var avatarIcon: CircleImage!
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: Variables
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width - 60
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.userDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupUserInfo()
    }

    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){}
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        if AuthService.instance.isLoggedIn {
            let profile = ProfileVC()
            profile.modalPresentationStyle = .custom
            present(profile, animated: true, completion: nil)
        } else {
            performSegue(withIdentifier: TO_LOGIN, sender: nil)
        }
    }
    
    @objc func userDataDidChange(_ notif: Notification) {
        setupUserInfo()
    }
    
    func setupUserInfo() {
        if AuthService.instance.isLoggedIn {
            loginButton.setTitle(UserDataService.instance.name, for: .normal)
            avatarIcon.image = UIImage(named: UserDataService.instance.avatarName)
            avatarIcon.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        } else {
            loginButton.setTitle("Login", for: .normal)
            avatarIcon.image = UIImage(named: "menuProfileIcon")
            avatarIcon.backgroundColor = UIColor.clear
        }
    }
    
    
}

extension ChannelVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MessageService.instance.channels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "channelCell", for: indexPath) as? ChannelCell {
            let channel = MessageService.instance.channels[indexPath.row]
            cell.configureCell(channel: channel)
            return cell
        } else {
            return ChannelCell()
        }
        
    }
    
}
