//
//  Drinks.swift
//  Cocktails
//
//  Created by Thomas Garayua on 4/7/24.
//

import Foundation

struct DrinksResponse: Codable {
    let drinks: [Cocktail]
}

struct Cocktail: Codable {
    let idDrink: String
    let strDrink: String
    let strDrinkThumb: String
}

enum NetworkError: Error {
    case invalidURL
    case requestFailed
    case invalidResponse
    case decodingError
}
