//
//  ViewController.swift
//  SwiftBluetoothAppStarter
//
//  Created by MacBook on 1/25/19.
//  Copyright © 2019 Ahil. All rights reserved.
//

import UIKit

class MainBluetoothVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

extension MainBluetoothVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "blueCell", for: indexPath) as? BluetoothCell else {return BluetoothCell()}
        cell.configureCell(name: "aaa", rssi: "aaaa")
        return cell
    }
    
    
}

