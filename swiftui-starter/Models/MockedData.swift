//
//  MockedData.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 4/18/22.
//

import Foundation

#if DEBUG

    extension Country {
        static let mockedData: [Country] = [
            Country(name: "United States", translations: [:], population: 125_000_000,
                    flag: URL(string: "https://flagcdn.com/us.svg"), alpha3Code: "USA"),
            Country(name: "Georgia", translations: [:], population: 2_340_000, flag: nil, alpha3Code: "GEO"),
            Country(name: "Canada", translations: [:], population: 57_600_000, flag: nil, alpha3Code: "CAN"),
        ]
    }

    extension Country.Details {
        static var mockedData: [Country.Details] = {
            let neighbors = Country.mockedData
            return [
                Country.Details(capital: "Sin City", currencies: Country.Currency.mockedData, neighbors: neighbors),
                Country.Details(capital: "Los Angeles", currencies: Country.Currency.mockedData, neighbors: []),
                Country.Details(capital: "New York", currencies: [], neighbors: []),
                Country.Details(capital: "Moscow", currencies: [], neighbors: neighbors),
            ]
        }()
    }

    extension Country.Currency {
        static let mockedData: [Country.Currency] = [
            Country.Currency(code: "USD", symbol: "$", name: "US Dollar"),
            Country.Currency(code: "EUR", symbol: "€", name: "Euro"),
            Country.Currency(code: "RUB", symbol: "‡", name: "Rouble"),
        ]
    }

#endif
