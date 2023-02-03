//
//  APITests.swift
//  APITests
//
//  Created by Mykyta Yefremchenkov on 2023-02-02.
//

import XCTest

final class APITests: XCTestCase {
    func test_proper_user_input() async {
        let sut = await CarListViewModel()
        
        let actual = await sut.loadData(num: "10", selection: "VIN")
        let expected = 10
        
        XCTAssertEqual(actual.count, expected)
    }
    
    func test_out_of_range_user_input() async {
        let sut = await CarListViewModel()
        
        let actual = await sut.loadData(num: "101", selection: "VIN")
        let expected = 0
        
        XCTAssertEqual(actual.count, expected)
    }
}
