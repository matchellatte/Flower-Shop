//
//  CartView.swift
//  FlowerShop
//
//  Created by STUDENT on 10/2/24.
//
import SwiftUI
import Foundation

struct CartView: View {
    @ObservedObject var flowerStore: FlowerStore
    @State private var showConfirmation = false
    @State private var selectedFlower: Flower?

    var body: some View {
        VStack {
            List {
                ForEach(flowerStore.flowers.filter { $0.isInCart }) { flower in
                    HStack {
                        // Flower Image
                        Image(flower.image)
                            .resizable()
                           
                            .frame(width: 70, height: 70)
                            .cornerRadius(5)

                        // Flower Name
                        Text(flower.name)
                            .font(.headline)
                            .padding(.leading, 8)

                        Spacer()
                        
                        // Flower Price
                        Text(String(format: "$%.2f", flower.price))
                            .font(.subheadline)
                            .foregroundColor(Color(red: 0.662, green: 0.251, blue: 0.392)) // #A94064

                        // Quantity
                        Text("Qty: \(flower.quantity)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .padding(.leading, 8)
                    }
                    .swipeActions {
                        Button(role: .destructive) {
                            selectedFlower = flower
                            showConfirmation = true
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                }
            }
            .listStyle(PlainListStyle())
            
            // Total Price Section
            VStack(alignment: .leading, spacing: 10) {
                Text("Total Price: \(totalPriceString)")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding()
                Button(action: {
                   
                }) {
                    Text("Checkout")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(red: 0.662, green: 0.251, blue: 0.392)) // #A94064
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .font(.headline)
                }
                .padding([.leading, .trailing, .bottom])
            }
        }
        .navigationTitle("Your Cart")
        .confirmationDialog("Are you sure you want to delete this item?", isPresented: $showConfirmation) {
            Button("Delete", role: .destructive) {
                if let flower = selectedFlower {
                    flowerStore.removeFlowerFromCart(flower)
                }
            }
        }
    }
    

    private var totalPriceString: String {
        let total = flowerStore.flowers.filter { $0.isInCart }.reduce(0) { $0 + ($1.price * Double($1.quantity)) } // Total based on quantity
        return String(format: "$%.2f", total)
    }
}
