//
//  FlowerStore.swift
//  FlowerShop
//
//  Created by STUDENT on 10/2/24.
//

import Foundation
import SwiftUI

class FlowerStore: ObservableObject {
    @Published var flowers: [Flower] = [
        Flower(name: "Celestial Sunrise", description: "A vibrant arrangement of orange lilies, yellow sunflowers, and pink roses, symbolizing the warmth and hope of a new beginning.", price: 45.0, image: "bouquet-1", isFavorite: false, isInCart: false, quantity: 0),
        Flower(name: "Midnight Serenade", description: "A romantic blend of deep purple orchids, navy blue hydrangeas, and white lilies, evoking the mystery and elegance of a moonlit night.", price: 50.0, image: "bouquet-2", isFavorite: false, isInCart: false, quantity: 0),
        Flower(name: "Ocean Breeze", description: "A refreshing mix of light blue delphiniums, white calla lilies, and green eucalyptus, capturing the serenity and coolness of the ocean.", price: 40.0, image: "bouquet-3", isFavorite: false, isInCart: false, quantity: 0),
        Flower(name: "Golden Hour", description: "A luxurious bouquet of champagne roses, gold-dipped eucalyptus, and a touch of lavender, inspired by the soft, golden light of sunset.", price: 55.0, image: "bouquet-4", isFavorite: false, isInCart: false, quantity: 0),
        Flower(name: "Starry Night", description: "A whimsical arrangement of dark purple dahlias, silver eucalyptus, and twinkling lights, reminiscent of a starry night sky.", price: 60.0, image: "bouquet-5", isFavorite: false, isInCart: false, quantity: 0),
        Flower(name: "Vintage Charm", description: "A nostalgic mix of vintage-inspired roses, dusty miller, and a touch of lace, evoking the timeless beauty of the past.", price: 50.0, image: "bouquet-6", isFavorite: false, isInCart: false, quantity: 0),
        Flower(name: "Sunny Day", description: "A cheerful bouquet of yellow daisies, orange gerberas, and green button poms, bringing the warmth and joy of a sunny day indoors.", price: 35.0, image: "bouquet-7", isFavorite: false, isInCart: false, quantity: 0),
        Flower(name: "Secret Garden", description: "A hidden gem of white lilies, pink peonies, and green ferns, creating a sense of mystery and enchantment.", price: 70.0, image: "bouquet-8", isFavorite: false, isInCart: false, quantity: 0),
        Flower(name: "Urban Chic", description: "A modern and stylish arrangement of black calla lilies, succulents, and a touch of silver, perfect for the city dweller.", price: 65.0, image: "bouquet-9", isFavorite: false, isInCart: false, quantity: 0)
    ]
    
    
    func toggleFavorite(flower: Flower) {
        if let index = flowers.firstIndex(where: { $0.id == flower.id }) {
            flowers[index].isFavorite.toggle()
        }
    }
    
    func toggleCart(flower: Flower, quantity: Int) {
        if let index = flowers.firstIndex(where: { $0.id == flower.id }) {
            if flowers[index].isInCart {
                // Remove from cart
                flowers[index].isInCart = false
                flowers[index].quantity = 0 
            } else {
                // Add to cart
                flowers[index].isInCart = true
                flowers[index].quantity = quantity
            }
        }
    }
    
    func removeFlowerFromCart(_ flower: Flower) {
        if let index = flowers.firstIndex(where: { $0.id == flower.id }) {
            flowers[index].isInCart = false
            flowers[index].quantity = 0
        }
    }

    func removeFlowerFromFavorites(_ flower: Flower) {
        if let index = flowers.firstIndex(where: { $0.id == flower.id }) {
            flowers[index].isFavorite = false
        }
    }
    
    func updateFlowerQuantity(flower: Flower, quantity: Int) {
        if let index = flowers.firstIndex(where: { $0.id == flower.id }) {
            flowers[index].quantity = quantity
        }
    }
    
    
    func shareFlower(flower: Flower) -> String {
        return "Check out this flower: \(flower.name)\nDescription: \(flower.description)\nPrice: $\(String(format: "%.2f", flower.price))"
    }
}


struct ShareSheet: UIViewControllerRepresentable {
    let activityItems: [Any]

    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        return controller
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}
