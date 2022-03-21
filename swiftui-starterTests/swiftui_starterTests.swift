//
//  swiftui_starterTests.swift
//  swiftui-starterTests
//
//  Created by Ricardo Monteverde on 3/14/22.
//

import XCTest
@testable import swiftui_starter

class SwiftuiStarterTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testURLEncoding() {
        guard let url = URL(string: "https:www.google.com/") else {
            XCTAssertTrue(false, "Could not instantiate url")
            return
        }
        var urlRequest = URLRequest(url: url)
        let parameters: Parameters = [
            "UserID": 1,
            "Name": "test",
            "Email": "test@gmail.com",
            "Subscribe": true
        ]

        do {
            let encoder = URLParameterEncoder()
            try encoder.encode(urlRequest: &urlRequest, with: parameters)
            guard let fullURL = urlRequest.url else {
                XCTAssertTrue(false, "urlRequest url is nil.")
                return
            }

            let expectedURL = "https:www.google.com/?Name=test&Email=test%2540gmail.com&UserID=1&Subscribe=true"
            XCTAssertEqual(fullURL.absoluteString.sorted(), expectedURL.sorted())
        } catch {

        }
    }

    func testAPI_getBoutiques() {

        // swiftlint:disable empty_parentheses_with_trailing_closure
        let networkManager = NetworkManager()
        networkManager.getBoutiques() { boutiques, error in
            guard let boutiques = boutiques else { return }
            for boutique in boutiques {
                print(" data: \(boutique)")
            }
            print("  error: \(String(describing: error))")
        }
    }

}
