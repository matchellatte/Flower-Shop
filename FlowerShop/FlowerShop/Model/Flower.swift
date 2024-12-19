//
//  Flower.swift
//  FlowerShop
//
//  Created by STUDENT on 10/3/24.
//

import Foundation
import SwiftUI

struct Flower: Identifiable {
    let id = UUID()
    var name: String
    var description: String
    var price: Double
    var image: String
    var isFavorite: Bool
    var isInCart: Bool
    var quantity: Int 
}
