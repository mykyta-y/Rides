//
//  DetailsVeiw.swift
//  Rides
//
//  Created by Mykyta Yefremchenkov on 2023-01-26.
//

import SwiftUI

struct DetailsView: View {
    @StateObject var viewModel = ViewModel()
    let ride: Ride
    var body: some View {
        TabView {
            VStack{
                Text("Vehicle Details")
                    .font(.largeTitle)
                    .underline()
                CarDetail(title: "VIN: ", info: ride.vin)
                CarDetail(title: "Make & Model: ", info: ride.make_and_model)
                CarDetail(title: "Color: ", info: ride.color)
                CarDetail(title: "Type: ", info: ride.car_type)
            }
            co2View(ride: ride)
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
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

struct co2View: View {
    @StateObject var viewModel = ViewModel()
    let ride: Ride
    var body: some View {
        let co2 = viewModel.emissions(km: ride.kilometrage)
        VStack {
            Text("CO2 emissions")
                .font(.largeTitle)
                .underline()
                .frame(width: .infinity, height: 100, alignment: .center)
            Text("\(String(co2)) g/km 🚗💨")
                .font(.title)
                .frame(width: .infinity, height: 100, alignment: .center)
            Text("* estimate")
                .font(.caption)
        }
    }
}

//struct DetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailsView()
//    }
//}
