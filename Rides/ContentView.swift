//
//  ContentView.swift
//  Rides
//
//  Created by Mykyta Yefremchenkov on 2023-01-24.
//

import SwiftUI
import Combine

struct ContentView: View {
    @StateObject var vm = CarListViewModel()
    @State var num: String = ""
    @State var selection: String = "VIN"
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack {
            HStack {
                TextField("# of cars to display", text: $num)
                    .focused($isFocused)
                    .keyboardType(.numberPad)
                    .onReceive(Just(num)) { newValue in
                        let filtered = newValue.filter {"0123456789".contains($0)}
                        if filtered != newValue {
                            self.num = filtered
                        }
                    }
                    .padding(.horizontal)
                Button {
                    Task {
                        print("button pressed")
                        await vm.loadRides(num: num, selection: selection)
                        self.num = ""
                        isFocused = false
                    }
                } label: {
                    Label("Search",systemImage: "magnifyingglass.circle.fill")
                        .font(.title2)
                }
                .disabled(vm.shouldDisableButton(num: num))
            }
            .padding()
            if vm.showInputError(num: num) {
                Text("* Enter # between 1 and 100")
                    .font(.callout)
                    .foregroundColor(.red)
            }
            Text("Sorted by: ")
            Picker(selection: $selection,
                   label: Text("Sorted by:"),
                   content: {
                ForEach(sortOption.indices, id: \.self) {index in
                    Text(sortOption[index])
                        .tag(sortOption[index])
                }
            })
            .padding(.horizontal, 30)
            .onChange(of: selection) { _ in
                vm.sortResults(selection: selection)
            }
            .pickerStyle(SegmentedPickerStyle())
            NavigationView {
                List {
                    ForEach(vm.rides, id: \.self) {ride in
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
