//
//  FlowerRow.swift
//  FlowerShop
//
//  Created by STUDENT on 10/2/24.
//
import SwiftUI
import Foundation

struct FlowerRow: View {
    @ObservedObject var flowerStore: FlowerStore
    var flower: Flower

    var body: some View {
        HStack(spacing: 15) {
            // Flower Image
            Image(flower.image)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .cornerRadius(10)
                .clipped()
            
            // Flower Details
            VStack(alignment: .leading, spacing: 5) {
                Text(flower.name)
                    .font(.headline)
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .truncationMode(.tail)
                Text(flower.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2)
                    .truncationMode(.tail)
                Text(String(format: "$%.2f", flower.price))
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(red: 0.662, green: 0.251, blue: 0.392))
            }
            Spacer()
            
            // Favorite Button
            Button(action: {
                flowerStore.toggleFavorite(flower: flower)
            }) {
                Image(systemName: flower.isFavorite ? "heart.fill" : "heart")
                    .foregroundColor(flower.isFavorite ? .red : .gray)
                    .font(.title2)
            }
        }
        .padding()
        .cornerRadius(10)
        .contextMenu {
            Button(action: {
                flowerStore.toggleFavorite(flower: flower)
            }) {
                Label(flower.isFavorite ? "Remove from Favorites" : "Add to Favorites", systemImage: "heart")
            }
            Button(action: {
                shareFlower(flower)
            }) {
                Label("Share", systemImage: "square.and.arrow.up")
            }
        }
    }
    
    private func shareFlower(_ flower: Flower) {
  
        print("Sharing \(flower.name)")
    }
}
