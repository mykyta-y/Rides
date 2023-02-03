//
//  DetailsVeiw.swift
//  Rides
//
//  Created by Mykyta Yefremchenkov on 2023-01-26.
//

import SwiftUI

struct DetailsView: View {
    @StateObject var vm = CarListViewModel()
    let ride: RideModel
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
                .padding(.vertical, 10)
            Text(info)
                .font(.title)
                .padding(.vertical, 10)
        }
    }
}

struct co2View: View {
    @StateObject var vm = CarListViewModel()
    let ride: RideModel
    var body: some View {
        let co2 = vm.emissions(km: ride.kilometrage)
        VStack {
            Text("CO2 emissions")
                .font(.largeTitle)
                .underline()
                //.frame(width: .infinity, height: 100, alignment: .center)
                .padding(.vertical, 20)
            Text("\(String(co2)) g/km 🚗💨")
                .font(.title)
                //.frame(width: .infinity, height: 100, alignment: .center)
                .padding(.vertical, 20)
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
