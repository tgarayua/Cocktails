//
//  ContentView.swift
//  Cocktails
//
//  Created by Thomas Garayua on 4/7/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = AlcoholicDrinksViewModel()
    @State private var isAnimating = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Spacer()
                
                Image("cocktail icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .rotationEffect(.degrees(isAnimating ? 360 : 0))
                    .animation(.easeInOut(duration: 1.0))
                    
                Spacer()
                
                Text("Welcome to the Cocktail App!")
                    .font(.title2)
                    .fontWeight(.bold)
                Text("Choose your drink type")
                    .font(.title3)
                    .fontWeight(.bold)
                
                Spacer()
                
                NavigationLink(destination: AlcoholicDrinksView()) {
                    HStack {
                        Image("martini-glass-citrus-solid (1)")
                            .resizable()
                            .foregroundColor(.black)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                        
                        Text("Alcoholic Drinks")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .background(Color.blue)
                            .cornerRadius(8)
                            .shadow(radius: 4)
                    }
                }
                
                NavigationLink(destination: NonAlcoholicDrinksView()) {
                    HStack {
                        Image("whiskey-glass-solid")
                            .resizable()
                            .foregroundColor(.black)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                        
                        Text("Non Alcoholic Drinks")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .background(Color.blue)
                            .cornerRadius(8)
                            .shadow(radius: 4)
                    }
                }
                Spacer()
            }
            .padding()
            .onAppear {
                isAnimating = true
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
