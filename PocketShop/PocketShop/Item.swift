//
//  Item.swift
//  PocketShop
//
//  Created by Leslie Tzeng on 12/3/16.
//  Copyright © 2016 Leslie Tzeng. All rights reserved.
//

import UIKit

class Item: Hashable, Equatable {
    var image: UIImage?
    var barcode:Int
    var name:String
    var hashValue:Int
    
    
    init?(name:String, barcode:Int) {
        self.name = name
        self.barcode = barcode
        self.hashValue = name.hashValue + barcode.hashValue
    }
    static func ==(lhs: Item, rhs: Item) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }

    
}
