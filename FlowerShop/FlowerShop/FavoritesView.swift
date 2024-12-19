//
//  FavoritesView.swift
//  FlowerShop
//
//  Created by STUDENT on 10/2/24.
//
import SwiftUI
import Foundation

struct FavoritesView: View {
    @ObservedObject var flowerStore: FlowerStore
    @State private var showConfirmation = false
    @State private var selectedFlower: Flower?
    @State private var isSharing = false

    var body: some View {
        List {
            ForEach(flowerStore.flowers.filter { $0.isFavorite }) { flower in
                FlowerRow(flowerStore: flowerStore, flower: flower)
                    .contextMenu {
                        Button(action: {
                            flowerStore.removeFlowerFromFavorites(flower)
                        }) {
                            Label("Remove from Favorites", systemImage: "trash")
                        }
                        Button(action: {
                            isSharing = true 
                        }) {
                            Label("Share", systemImage: "square.and.arrow.up")
                        }
                    }
                    .sheet(isPresented: $isSharing) {
                        ActivityView(activityItems: ["Check out this flower: \(flower.name) at price: \(String(format: "$%.2f", flower.price))"])
                    }
            }
        }
        .navigationTitle("Favorites")
        .confirmationDialog("Are you sure you want to delete this flower from your favorites?", isPresented: $showConfirmation) {
            Button("Delete", role: .destructive) {
                if let flower = selectedFlower {
                    flowerStore.removeFlowerFromFavorites(flower)
                }
            }
            Button("Cancel", role: .cancel) {}
        }
    }
}
