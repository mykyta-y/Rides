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
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack {
            HStack {
                TextField("# of cars to display", text: $num)
                    .focused($isFocused)
                    .keyboardType(.numberPad)
                    .padding(.horizontal)
                Button {
                    viewModel.loadData(num: num, selection: selection)
                    self.num = ""
                    isFocused = false
                } label: {
                    Label("Search",systemImage: "magnifyingglass.circle.fill")
                        .font(.title2)
                }
                .disabled(num.isEmpty || Int(num) == 0 || Int(num) ?? 0>100)
            }
            .padding()
            if Int(num) == 0 || Int(num) ?? 0>100 {
                Text("* Enter # between 1 and 100")
                    .font(.callout)
                    .foregroundColor(.red)
            }
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
                                Text(ride.make_and_model)
                                Text(ride.vin)                                
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
