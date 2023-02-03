//
//  APITests.swift
//  APITests
//
//  Created by Mykyta Yefremchenkov on 2023-01-30.
//

import XCTest

final class APITests: XCTestCase {
    func test_valid_user_input() {
        let sut = CarListViewModel()
        
        let actual = sut.loadData(num: "10", selection: "VIN")
        let expected = 10
        
        XCTAssertEqual(actual.count, expected)
    }
}
