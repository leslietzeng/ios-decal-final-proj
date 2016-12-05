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
    var total: Float = 0
    @IBOutlet weak var subtotalLabel: UILabel!
    var store: Store?
    
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
        let item1 = Item(name: "TOBLERONE MILK CHOC", image: UIImage(named: "Toblerone")!)!
        let item2 = Item(name: "CLOROX CLEANER", image: UIImage(named: "Clorox")!)!
        let item3 = Item(name: "SKITTLES", image: UIImage(named: "Skittles")!)!
        let cartItem1 = CartItem(item: item1, price: 1.50, quantity: 10)!
        let cartItem2 = CartItem(item: item2, price: 3.99, quantity: 2)!
        let cartItem3 = CartItem(item: item3, price: 2.00, quantity: 10)!
        cartItems += [cartItem1, cartItem2, cartItem3]
        updateTotal()
        
    }
    func updateTotal() {
        total = 0
        for cartItem in cartItems {
            total += cartItem.price * Float(cartItem.quantity)
        }
        subtotalLabel.text = String(format:"$%.2f", total)
        
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
    // MARK: Actions
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func unwindToViewController(sender: UIStoryboardSegue)
    {
        if sender.identifier == "hackyButtonSegue" {
            let sourceViewController = sender.source as! QRScannerController
            // Pull any data from the view controller which initiated the unwind segue.
            //technically lookup from barcode to Item
            let item1 = Item(name: "KIMCHI FRIED RICE", barcode: sourceViewController.messageLabel.text!, image: UIImage(named:"KimchiFriedRice")!)!
            let price1 = store!.productList[item1]!
            var found = false
            for cartItem in cartItems {
                if cartItem.name == item1.name {
                    cartItem.quantity += 1
                    found = true
                }
            }
            if !found {
                cartItems += [CartItem(item: item1, price: price1, quantity: 1)!]
            }
            updateTotal()
            self.tableView.reloadData()
        }
    }
    
}
