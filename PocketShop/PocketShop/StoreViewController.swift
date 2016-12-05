//
//  StoreViewController.swift
//  PocketShop
//
//  Created by Leslie Tzeng on 12/3/16.
//  Copyright © 2016 Leslie Tzeng. All rights reserved.
//

import UIKit

class StoreViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: Properties
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var store:Store!
    var featuredItems:[Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        self.title = store.name
        print(store.name)
        loadFeaturedItems()
        // Do any additional setup after loading the view.
    }
    func loadFeaturedItems() {
        featuredItems = Array(store.productList.keys)
        print(featuredItems.first!.name)
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
        return featuredItems.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoreViewTableViewCell", for: indexPath) as! StoreViewTableViewCell
        
        // Configure the cell...
        let item = featuredItems[indexPath.row]

        cell.itemPhoto.image = item.image
        cell.nameLabel.text = item.name
        cell.priceLabel.text = String(format:"$%.2f ea.", store.productList[item]!)
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Featured Items"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //find root controller
        let nav = segue.destination as! UINavigationController
        let destination = nav.topViewController as! CartViewController
        destination.store = self.store
    }
    
    
    

}
