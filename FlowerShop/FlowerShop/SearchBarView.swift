//
//  SearchBarView.swift
//  FlowerShop
//
//  Created by STUDENT on 10/2/24.
//
import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {

            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding(.leading, 10)

            TextField("Search flowers", text: $searchText)
                .foregroundColor(.primary)
                .padding(8)

            if !searchText.isEmpty {
                Button(action: {
                    searchText = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                        .padding(.trailing, 10)
                }
            }
        }

        .cornerRadius(10)

    }
}


