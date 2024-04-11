//
//  AlcoholicDrinksViewModel.swift
//  Cocktails
//
//  Created by Thomas Garayua on 4/10/24.
//

import Foundation

class AlcoholicDrinksViewModel: ObservableObject {
    @Published var cocktails: [Cocktail] = []
    private let networkManager = NetworkManager()
    
    func fetchAlcoholicCocktails() {
        Task {
            do {
                let fetchedCocktails = try await networkManager.fetchAlcoholicDrinks()
                DispatchQueue.main.async {
                    self.cocktails = fetchedCocktails ?? []
                }
            } catch {
                print("Error fetching cocktails: \(error)")
            }
        }
    }
}
