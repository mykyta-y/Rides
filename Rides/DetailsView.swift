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
            HStack {
                Text("VIN: ")
                    .font(.title3)
                    .fontWeight(.bold)
                    .frame(width: .infinity, height: 50, alignment: .leading)
                Text(ride.vin)
                    .font(.title)
                    .frame(width: .infinity, height: 50, alignment: .trailing)
            }
            HStack {
                Text("Make and Model: ")
                    .font(.title3)
                    .fontWeight(.bold)
                    .frame(width: .infinity, height: 50, alignment: .leading)
                Text(ride.make_and_model)
                    .font(.title)
                    .frame(width: .infinity, height: 50, alignment: .trailing)
            }
            HStack {
                Text("Color: ")
                    .font(.title3)
                    .fontWeight(.bold)
                    .frame(width: .infinity, height: 50, alignment: .leading)
                Text(ride.color)
                    .font(.title)
                    .frame(width: .infinity, height: 50, alignment: .trailing)
            }
            HStack {
                Text("Type: ")
                    .font(.title3)
                    .fontWeight(.bold)
                    .frame(width: .infinity, height: 50, alignment: .leading)
                Text(ride.car_type)
                    .font(.title)
                    .frame(width: .infinity, height: 50, alignment: .trailing)
            }
        }
    }
}

//struct DetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailsView()
//    }
//}
