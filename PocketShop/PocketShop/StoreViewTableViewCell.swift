//
//  StoreViewTableViewCell.swift
//  PocketShop
//
//  Created by Leslie Tzeng on 12/3/16.
//  Copyright © 2016 Leslie Tzeng. All rights reserved.
//

import UIKit

class StoreViewTableViewCell: UITableViewCell {
    
    // MARK: Properties
    
    @IBOutlet weak var itemPhoto: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
