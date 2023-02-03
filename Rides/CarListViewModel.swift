//
//  ViewModel.swift
//  Rides
//
//  Created by Mykyta Yefremchenkov on 2023-01-25.
//

import Foundation
import SwiftUI

@MainActor
class CarListViewModel: ObservableObject {
    @Published var rides: [RideModel] = []
    func loadData(num: String, selection: String) async -> [RideModel] {
        if shouldFetchBasedOnUserInput(on: num){
            do {
                guard let url = URL(string: "https://random-data-api.com/api/vehicle/random_vehicle?size=\(num)") else {
                    return []
                }
                let (data, _) = try await URLSession.shared.data(from: url)
                let rides = try JSONDecoder().decode([RideModel].self, from: data)
                print(rides)
                return rides
            } catch {
                print(error)
            }
        }
        return []
    }
    
    func loadRides(num: String, selection: String) async {
            let rides = await loadData(num: num, selection: selection)
            self.rides = rides
            self.rides.sort(by: {$0.vin < $1.vin})
    }
    
    func shouldFetchBasedOnUserInput(on num: String) -> Bool {
        if (!num.isEmpty || Int(num) ?? 0 > 0 || Int(num) ?? 0 <= 100) {
            return true
        }
        return false
    }
    
    func sortResults(selection: String) {
        if selection == "VIN" {
            self.rides.sort(by: {$0.vin < $1.vin})
        } else {
            self.rides.sort(by: {$0.car_type < $1.car_type})
        }
    }
    
    func shouldDisableButton(num: String) -> Bool {
        if (num.isEmpty || (Int(num) ?? 0) <= 0 || (Int(num) ?? 0) > 100){
            return true
        }
        return false
    }
    
    func showInputError(num: String) -> Bool {
        if ((Int(num) ?? 1) <= 0 || (Int(num) ?? 1) > 100) {
            return true
        }
        return false
    }
    
    func emissions(km: Int) -> Int {
        var units: Float
        var co2: Float
        if km <= 5000 {
            units = Float(km) * 0.1
        } else {
            var first5: Float
            var rest: Float
            first5 = 5000 * 0.1
            rest = (Float(km) - 5000) * 0.15
            units = first5 + rest
        }
        co2 = (units / Float(km)) * 1000
        return Int(co2)
    }
}
