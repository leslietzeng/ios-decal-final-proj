//
//  CartViewController.swift
//  PocketShop
//
//  Created by Leslie Tzeng on 12/3/16.
//  Copyright © 2016 Leslie Tzeng. All rights reserved.
//

import UIKit


class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    var cartItems = [CartItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.layer.borderWidth = 2.0
        tableView.layer.borderColor = UIColor.gray.cgColor
        loadSampleCart()
    }
    
    func loadSampleCart() {
        let item1 = CartItem(item: Item(name: "TOBLERONE MILK CHOC", barcode: 0)!, price: 1.50, quantity: 10)!
        let item2 = CartItem(item: Item(name: "CLOROX CLEANER",      barcode: 0)!, price: 3.99, quantity: 2)!
        let item3 = CartItem(item: Item(name: "SKITTLES",            barcode: 0)!, price: 2.00, quantity: 10)!
        cartItems += [item1, item2, item3]
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItems.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartItemTableViewCell", for: indexPath) as! CartItemTableViewCell
        
        // Configure the cell...
        let cartItem = cartItems[indexPath.row]
        cell.nameLabel.text = cartItem.name
        cell.pricePerLabel.text = "@" + String(format: "%.2f", cartItem.price) + " ea."
        cell.quantityLabel.text = String(format: "%d", cartItem.quantity)
        let totalPrice:Float = cartItem.price * Float(cartItem.quantity)
        cell.totalPriceLabel.text = String(format: "%.2f", totalPrice)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
