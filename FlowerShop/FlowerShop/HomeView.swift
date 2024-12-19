//
//  HomeView.swift
//  FlowerShop
//
//  Created by STUDENT on 10/2/24.
//
import SwiftUI

struct HomeView: View {
    @StateObject var flowerStore = FlowerStore()
    @State private var searchText = ""
    
    var body: some View {
        TabView {
            // Home Tab
            NavigationStack {
                VStack(spacing: 20) {
                
                    HStack {
                        Text("𖤣.𖥧Flower Shop𖡼.⚘")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color(red: 0.662, green: 0.251, blue: 0.392)) //
                        Spacer()
                    }
                    .padding([.horizontal, .top])

                    // Search Bar
                    SearchBarView(searchText: $searchText)
                        .padding(.horizontal)

                   
                    List {
                        // Banner Image
                        Image("banner-1")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 260)
                            .cornerRadius(15)
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                            .padding(.bottom, 10)

                        // Flower List
                        Section(header: Text("Our Flowers").font(.title2).fontWeight(.bold).foregroundColor(Color(red: 0.662, green: 0.251, blue: 0.392))) {
                            ForEach(filteredFlowers) { flower in
                                NavigationLink(destination: FlowerDetailView(flowerStore: flowerStore, flower: flower)) {
                                    FlowerRow(flowerStore: flowerStore, flower: flower)
                                }
                            }
                        }
                    }
                    .listStyle(PlainListStyle())
                }

            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }

            // Cart Tab
            NavigationStack {
                CartView(flowerStore: flowerStore)
            }
            .tabItem {
                Image(systemName: "cart.fill")
                Text("Cart")
            }

            // Favorites Tab
            NavigationStack {
                FavoritesView(flowerStore: flowerStore)
            }
            .tabItem {
                Image(systemName: "heart.fill")
                Text("Favorites")
            }

            // Profile Tab
            NavigationStack {
                ProfileView()
            }
            .tabItem {
                Image(systemName: "person.fill")
                Text("Profile")
            }
        }
    }


    var filteredFlowers: [Flower] {
        if searchText.isEmpty {
            return flowerStore.flowers
        } else {
            return flowerStore.flowers.filter { $0.name.contains(searchText) }
        }
    }
}

#Preview {
    HomeView()
}
