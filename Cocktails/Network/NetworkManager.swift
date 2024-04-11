//
//  NetworkManager.swift
//  Cocktails
//
//  Created by Thomas Garayua on 4/7/24.
//

import Foundation

class NetworkManager: ObservableObject {
    private let baseURL = "https://www.thecocktaildb.com/api/json/v1/1/"
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func fetchAlcoholicDrinks() async throws -> [Cocktail]? {
        let cocktailsAPIUrl = baseURL + "filter.php?a=Alcoholic"
        
        guard let url = URL(string: cocktailsAPIUrl) else {
            throw NetworkError.invalidURL
        }
        
        let (data, _) = try await session.data(from: url)
        let decoder = JSONDecoder()
        
        guard let drinksResponse = try? decoder.decode(DrinksResponse.self, from: data) else {
            throw NetworkError.decodingError
        }
        return drinksResponse.drinks
    }
    
    func fetchNonAlcoholicDrinks() async throws -> [Cocktail]? {
        let cocktailsAPIUrl = baseURL + "filter.php?a=Non_Alcoholic"
        
        guard let url = URL(string: cocktailsAPIUrl) else {
            throw NetworkError.invalidURL
        }
        
        let (data, _) = try await session.data(from: url)
        let decoder = JSONDecoder()
        
        guard let drinksResponse = try? decoder.decode(DrinksResponse.self, from: data) else {
            throw NetworkError.decodingError
        }
        return drinksResponse.drinks
    }
}
