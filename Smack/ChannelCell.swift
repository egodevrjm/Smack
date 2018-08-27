//
//  ChannelCell.swift
//  buzzUp
//
//  Created by Ryan Morrison on 27/08/2018.
//  Copyright © 2018 Ryan Morrison. All rights reserved.
//

import UIKit

class ChannelCell: UITableViewCell {

    //MARK: Outlets
    @IBOutlet weak var channelName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            self.layer.backgroundColor = UIColor(white: 1, alpha: 0.2).cgColor
        } else {
            self.layer.backgroundColor = UIColor.clear.cgColor
        }
    }
    
    func configureCell(channel: Channel) {
        let title = channel.channelTitle ?? ""
        channelName.text = "#\(title)"
    }

}
