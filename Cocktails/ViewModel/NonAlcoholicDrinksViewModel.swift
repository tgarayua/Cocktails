//
//  NonAlcoholicDrinksViewModel.swift
//  Cocktails
//
//  Created by Thomas Garayua on 4/11/24.
//

import Foundation

class NonAlcoholicDrinksViewModel: ObservableObject {
    @Published var cocktails: [Cocktail]? = []
    private let networkManager = NetworkManager()
    
    func fetchNonAlcoholicCocktails() {
        Task {
            do {
                let fetchedCocktails = try await networkManager.fetchNonAlcoholicDrinks()
                DispatchQueue.main.async {
                    self.cocktails = fetchedCocktails
                }
            } catch {
                print("Error fetching cocktails: \(error)")
            }
        }
    }
}
