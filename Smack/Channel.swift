//
//  Channel.swift
//  buzzUp
//
//  Created by Ryan Morrison on 27/08/2018.
//  Copyright © 2018 Ryan Morrison. All rights reserved.
//

import Foundation

struct Channel: Decodable {
    public private(set) var channelTitle: String!
    public private(set) var channelDescription: String!
    public private(set) var id: String!
}
