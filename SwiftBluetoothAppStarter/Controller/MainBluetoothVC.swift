//
//  ViewController.swift
//  SwiftBluetoothAppStarter
//
//  Created by MacBook on 1/25/19.
//  Copyright © 2019 Ahil. All rights reserved.
//

import UIKit
import CoreBluetooth

class MainBluetoothVC: UIViewController {

    //objects are used to manage discovered or connected remote peripheral devices 
    private var centralManager : CBCentralManager?
    
    private var names : [String] = []
    private var RSSIs : [NSNumber] = []
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        centralManager = CBCentralManager(delegate: self, queue: nil)
        
    }

    @IBAction func refreshButtonTapped(_ sender: Any) {
       startScan()
    }
    
    private func startScan(){
        names = []
        RSSIs = []
        tableView.reloadData()
        centralManager?.stopScan()
        centralManager?.scanForPeripherals(withServices: nil, options: nil)
    }
    
}

extension MainBluetoothVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "blueCell", for: indexPath) as? BluetoothCell else {return BluetoothCell()}
        cell.configureCell(name: names[indexPath.row], rssi: RSSIs[indexPath.row])
        return cell
    }
    
    
}

extension MainBluetoothVC: CBCentralManagerDelegate{
    
    //invoked when the central manager’s state is updated.
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn{
            startScan()
        }else{
            let alertVC = UIAlertController(title: "Bluetooth is not working", message: "Make your bluetooth is on", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { (action) in
                alertVC.dismiss(animated: true, completion: nil)
            }
            alertVC.addAction(action)
            present(alertVC, animated: true, completion: nil)
        }
    }
    
    //Invoked when the central manager discovers a peripheral while scanning
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        
        if let name = peripheral.name{
             names.append(name)
        }
        else{
            names.append(peripheral.identifier.uuidString)
        }
        RSSIs.append(RSSI)
        tableView.reloadData()
        
    }
    
    
}
