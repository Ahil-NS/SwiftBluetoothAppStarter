//
//  BluetoothCell.swift
//  SwiftBluetoothAppStarter
//
//  Created by MacBook on 1/27/19.
//  Copyright © 2019 Ahil. All rights reserved.
//

import UIKit

class BluetoothCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rssiLabel: UILabel!
    
    func configureCell(name: String , rssi: NSNumber){
        nameLabel.text = name
        rssiLabel.text = "\(rssi)"
    }
}
