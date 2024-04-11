//
//  NonAlcoholicDrinksView.swift
//  Cocktails
//
//  Created by Thomas Garayua on 4/11/24.
//

import SwiftUI

struct NonAlcoholicDrinksView: View {
    @StateObject private var viewModel = NonAlcoholicDrinksViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.cocktails ?? [], id: \.idDrink) { cocktail in
                HStack(spacing: 10) {
                    if let url = URL(string: cocktail.strDrinkThumb) {
                        AsyncImage(url: url) { phase in
                            switch phase {
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 100, height: 100) // Adjust size here
                                    .cornerRadius(10)
                            case .failure:
                                Image(systemName: "photo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 100, height: 100) // Adjust size here
                                    .cornerRadius(10)
                            case .empty:
                                ProgressView()
                                    .frame(width: 100, height: 100) // Adjust size here
                            @unknown default:
                                EmptyView()
                            }
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(cocktail.strDrink)
                            .font(.headline)
                            .foregroundColor(.primary)
                            .lineLimit(1)
                        
                        Text(cocktail.idDrink)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .lineLimit(1)
                    }
                    .padding(.vertical, 8)
                    
                    Spacer()
                }
                .padding(.vertical, 8)
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Non Alcoholic Drinks")
            .onAppear {
                viewModel.fetchNonAlcoholicCocktails()
            }
        }
    }
}


struct NonAlcoholicDrinksView_Previews: PreviewProvider {
    static var previews: some View {
        NonAlcoholicDrinksView()
    }
}
