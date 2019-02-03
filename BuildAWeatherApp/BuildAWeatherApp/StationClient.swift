//
//  StationClient.swift
//  BuildAWeatherApp
//
//  Created by 姜旦旦 on 2019/2/3.
//  Copyright © 2019 姜旦旦. All rights reserved.
//

import Foundation

class StationClient {
    lazy var baseURL = URL(string: "https://stations-98a59.firebaseio.com/practice.json")
    
    let decoder = JSONDecoder()

    let session: URLSession

    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }

    convenience init() {
        self.init(configuration: .default)
    }

    typealias CurrentStationCompletionHandler = (CurrentStation?, Error?) -> Void
    func getStation(completionHandler completion: @escaping CurrentStationCompletionHandler) {
        guard let url = baseURL else {
            completion(nil, StationError.invalidUrl)
            return
        }

        let request = URLRequest(url: url)
        
        
        let task = session.dataTask(with: request) { data, response, error in
         
            DispatchQueue.main.async {
                if let downloadedData = data {
                    guard let httpResponse = response as? HTTPURLResponse else {
                        completion(nil, StationError.requestFailed)
                        return
                    }
                    if httpResponse.statusCode == 200 {
                        do {
                            let station = try self.decoder.decode(CurrentStation.self, from: downloadedData)
                            completion(station, nil)
                        } catch let error {
                            completion(nil, error)
                        }
                    } else {
                        completion(nil, StationError.responseUnsuccessful(statusCode: httpResponse.statusCode))
                    }

                } else {
                    completion(nil, StationError.invalidData)
                }
            }
        }
        task.resume()
    }
    
}












