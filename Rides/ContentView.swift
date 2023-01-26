//
//  ContentView.swift
//  Rides
//
//  Created by Mykyta Yefremchenkov on 2023-01-24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    @State var num: String = ""
    @State var selection: String = "VIN"
    
    var body: some View {
        VStack {
            HStack {
                TextField("# of cars to display", text: $num)
                    .padding(.horizontal)
                Button {
                    viewModel.loadData(num: num, selection: selection)
                    self.num = ""
                } label: {
                    Label("Search",systemImage: "magnifyingglass.circle.fill")
                        .font(.title2)
                }
            }
            .padding()
            Text("Sorted by: ")
            Picker(selection: $selection,
                   label: Text("Sorted by: "),
                   content: {
                ForEach(sortOption.indices) {index in
                    Text(sortOption[index])
                        .tag(sortOption[index])
                }
            })
            .onChange(of: selection) { _ in
                viewModel.sortResults(selection: selection)
            }
            .pickerStyle(SegmentedPickerStyle())
            NavigationView {
                List {
                    ForEach(viewModel.rides, id: \.self) {ride in
                        HStack {
                            NavigationLink(destination: DetailsView(ride: ride)){
                                Text(ride.vin)
                                Text(ride.make_and_model)
                                //Text(ride.car_type)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
