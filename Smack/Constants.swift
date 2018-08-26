//
//  Constants.swift
//  Smack
//
//  Created by Ryan Morrison on 26/08/2018.
//  Copyright © 2018 Ryan Morrison. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

//MARK: URLs
let BASE_URL = "https://buzzupchat.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"

//MARK: Colors
let BUZZ_RED_PLACEHOLDER = #colorLiteral(red: 0.8129906058, green: 0.01060497388, blue: 0, alpha: 0.5)

//MARK: Notification
let NOTIF_USER_DATA_DID_CHANGE = Notification.Name("notifUserDataDidChange")

//MARK: Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"
let TO_AVATAR_PICKER = "toAvatarPicker"

//MARK: UserDefaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

//MARK: Headers

let HEADER = ["Content-Type" : "Application/json; charset=utf-8"]
