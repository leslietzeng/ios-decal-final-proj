//
//  Store.swift
//  PocketShop
//
//  Created by Leslie Tzeng on 12/3/16.
//  Copyright © 2016 Leslie Tzeng. All rights reserved.
//

import UIKit
class Store {
    var name:String
    var address:String
    var productList:[Item:Float] //dictionary
    
    init?(name:String, address:String, productList:[Item:Float]) {
        self.name = name
        self.address = address
        self.productList = productList
    }
}
