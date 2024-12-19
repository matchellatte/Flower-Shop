//
//  FlowerDetailView.swift
//  FlowerShop
//
//  Created by STUDENT on 10/2/24.
//
import SwiftUI
import Foundation

struct FlowerDetailView: View {
    @ObservedObject var flowerStore: FlowerStore
    var flower: Flower
    @State private var showCartAlert = false 
    @State private var showFavoriteAlert = false
    @State private var quantity = 1

    var body: some View {
        VStack(spacing: 20) {
            // Flower Image
            Image(flower.image)
                .resizable()
                .scaledToFit()
                .frame(height: 300)
                .cornerRadius(20)
                .padding(.top)

            // Flower name and favorite button
            HStack {
                Text(flower.name)
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                Button(action: {
                    flowerStore.toggleFavorite(flower: flower)
                    showFavoriteAlert = true // Show favorites alert
                }) {
                    Image(systemName: flower.isFavorite ? "heart.fill" : "heart")
                        .foregroundColor(flower.isFavorite ? Color(red: 0.662, green: 0.251, blue: 0.392) : .gray)
                        .font(.title2)
                }
            }
            .padding(.horizontal, 15)
            
            // Flower description
            Text(flower.description)
                .font(.body)
                .foregroundColor(.gray)
                .padding(.horizontal, 15)

            // Flower price and quantity selector
            HStack {
                Text(String(format: "$%.2f", flower.price))
                    .font(.title)
                    .fontWeight(.semibold)
                Spacer()
                HStack {
                    Button(action: {
                        if quantity > 1 {
                            quantity -= 1
                        }
                    }) {
                        Image(systemName: "minus.circle")
                            .foregroundColor(.gray)
                            .font(.title2)
                    }
                    
                    Text("\(quantity)")
                        .font(.title2)
                        .padding(.horizontal, 10)
                    
                    Button(action: {
                        quantity += 1
                    }) {
                        Image(systemName: "plus.circle")
                            .foregroundColor(.gray)
                            .font(.title2)
                    }
                }
            }
            .padding(.horizontal, 15)
            
            // Add to cart button
            Button(action: {
                flowerStore.toggleCart(flower: flower, quantity: quantity)
                showCartAlert = true
            }) {
                Text("Add to Cart")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(red: 0.662, green: 0.251, blue: 0.392))
                    .foregroundColor(.white)
                    .font(.headline)
                    .cornerRadius(10)
            }
            .alert("Added to Cart", isPresented: $showCartAlert) {
                Button("OK", role: .cancel) {}
            }
            .padding(.horizontal, 15)

            // Alert for favorites
            .alert("Added to Favorites", isPresented: $showFavoriteAlert) {
                Button("OK", role: .cancel) {}
            }

            Spacer()
        }
        .padding(.vertical)
        .navigationTitle(flower.name)
    }
}


