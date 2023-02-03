//
//  co2CalcTests.swift
//  co2CalcTests
//
//  Created by Mykyta Yefremchenkov on 2023-01-30.
//

import XCTest

final class co2CalcTests: XCTestCase {

    //Test emissions per km whem kilometrage is under 5K
    @MainActor func test_emissions_under5k_km() {
        let sut = CarListViewModel()
        
        let actual = sut.emissions(km: 4899)
        let expected = 100
        
        XCTAssertEqual(actual, expected)
    }
    
    //Test emissions per km when kilometrage is over 5K
    @MainActor func test_emissions_over5k_km() {
        let sut = CarListViewModel()
        
        let actual = sut.emissions(km: 15488)
        let expected = 133
        
        XCTAssertEqual(actual, expected)
    }
    
//    func test_nil_emissions() {
//        let sut = ViewModel()
//        
//        let actual = sut.emissions(km: nil)
//        let expected = nil
//        
//        XCTAssertEqual(actual, expected)
//    }
    
}
