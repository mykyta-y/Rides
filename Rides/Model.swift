//
//  Model.swift
//  Rides
//
//  Created by Mykyta Yefremchenkov on 2023-01-25.
//

import Foundation
import SwiftUI

struct Ride: Hashable, Codable {
    var vin: String
    var make_and_model: String
    var color: String
    var car_type: String
    var kilometrage: Int
    
    init(vin: String, make_and_model: String, color: String, car_type: String, kilometrage: Int) {
        self.vin = vin
        self.make_and_model = make_and_model
        self.color = color
        self.car_type = car_type
        self.kilometrage = kilometrage
    }
}

var sortOption: [String] = ["VIN", "Car Type"]
