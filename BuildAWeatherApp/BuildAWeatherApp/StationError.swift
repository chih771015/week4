//
//  StationError.swift
//  BuildAWeatherApp
//
//  Created by 姜旦旦 on 2019/2/3.
//  Copyright © 2019 姜旦旦. All rights reserved.
//

import Foundation

enum StationError: Error {
    case requestFailed
    case responseUnsuccessful(statusCode: Int)
    case invalidData
    case invalidUrl
}
