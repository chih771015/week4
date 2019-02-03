//
//  ViewController.swift
//  BuildAWeatherApp
//
//  Created by 姜旦旦 on 2019/2/3.
//  Copyright © 2019 姜旦旦. All rights reserved.
//

import UIKit





class ViewController: UIViewController {

    
    
    @IBOutlet weak var stationIDLabel: UILabel!
    @IBOutlet weak var stationNameLabel: UILabel!
    @IBOutlet weak var stationAddressLabel: UILabel!
    
    
    let client = StationClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCurrnetStation()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func displayStation(using viewModel: CurrentStationViewModel) {
        stationIDLabel.text = viewModel.stationID
        stationNameLabel.text = viewModel.stationName
        stationAddressLabel.text = viewModel.stationAddress
        
        
    }
    func getCurrnetStation() {
        client.getStation() { [unowned self] currentStation, error in
            if let currentStation = currentStation {
                let viewModel = CurrentStationViewModel(model: currentStation)
                self.displayStation(using: viewModel)
            }
        
        }
        
    }
    
}

