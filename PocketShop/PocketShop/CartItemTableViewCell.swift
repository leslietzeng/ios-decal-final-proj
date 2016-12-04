//
//  CartItemTableViewCell.swift
//  PocketShop
//
//  Created by Leslie Tzeng on 12/3/16.
//  Copyright © 2016 Leslie Tzeng. All rights reserved.
//

import UIKit

class CartItemTableViewCell: UITableViewCell {
    //MARK: Properties
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pricePerLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
