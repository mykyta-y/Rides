//
//  ViewModel.swift
//  Rides
//
//  Created by Mykyta Yefremchenkov on 2023-01-25.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var rides: [Ride] = []
    func loadData(num: String) {
        guard let url = URL(string: "https://random-data-api.com/api/vehicle/random_vehicle?size=\(num)") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) {[weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let rides = try JSONDecoder().decode([Ride].self, from: data)
                DispatchQueue.main.async {
                    
                    self?.rides = rides
                    self?.rides.sort(by: {$0.vin < $1.vin})
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
