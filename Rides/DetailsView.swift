//
//  DetailsVeiw.swift
//  Rides
//
//  Created by Mykyta Yefremchenkov on 2023-01-26.
//

import SwiftUI

struct DetailsView: View {
    let ride: Ride
    var body: some View {
        VStack{
            Text("Vehicle Details")
                .font(.largeTitle)
                .underline()
            CarDetail(title: "VIN: ", info: ride.vin)
            CarDetail(title: "Make and Model: ", info: ride.make_and_model)
            CarDetail(title: "Color: ", info: ride.color)
            CarDetail(title: "Type: ", info: ride.car_type)
        }
    }
}

struct CarDetail: View {
    var title: String
    var info: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title3)
                .fontWeight(.bold)
                .frame(width: .infinity, height: 50, alignment: .leading)
            Text(info)
                .font(.title)
                .frame(width: .infinity, height: 50, alignment: .trailing)
        }
    }
}

//struct DetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailsView()
//    }
//}
