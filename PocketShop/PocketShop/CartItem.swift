//
//  CartItem.swift
//  PocketShop
//
//  Created by Leslie Tzeng on 12/3/16.
//  Copyright © 2016 Leslie Tzeng. All rights reserved.
//

import UIKit

class CartItem {
    var price: Float
    var name:String
    var quantity: Int
    
    init?(item:Item, price: Float, quantity: Int) {
        self.name = item.name
        self.quantity = quantity
        self.price = price
    }
    
}
