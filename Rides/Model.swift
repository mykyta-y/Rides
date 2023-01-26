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
}

var sortOption: [String] = ["VIN", "Car Type"]
