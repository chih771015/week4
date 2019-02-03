//
//  CurrentStationViewModel.swift
//  BuildAWeatherApp
//
//  Created by 姜旦旦 on 2019/2/3.
//  Copyright © 2019 姜旦旦. All rights reserved.
//

import Foundation

import UIKit

struct CurrentStationViewModel {
    let stationID: String
    let stationName: String
    let stationAddress: String
    
    
    init(model: CurrentStation) {
       self.stationID = model.stationID
        self.stationName = model.stationName
        self.stationAddress = model.stationAddress
        
    }
    
    
}
