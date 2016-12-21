//
//  LocatorViewController.swift
//  PocketShop
//
//  Created by Leslie Tzeng on 12/3/16.
//  Copyright © 2016 Leslie Tzeng. All rights reserved.
//

import UIKit
import MapKit
import Firebase

class LocatorViewController: UIViewController, CLLocationManagerDelegate {
    
    
    
    // MARK: Properties
    @IBOutlet weak var mapView: MKMapView!
    let manager = CLLocationManager()

    var store:Store?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // from lecture
                manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        switch CLLocationManager.authorizationStatus() {
            case .authorized:
                manager.requestLocation()
                break
            case .notDetermined:
                manager.requestWhenInUseAuthorization()
            case .authorizedWhenInUse:
                manager.requestLocation()
                break
            case .restricted, .denied:
                //prompt notification: see next slides
                let alertController = UIAlertController(
                    title: "Background Location Access Disabled",
                    message: "In order to determine your nearest store, please open Settings and set location access for this app to 'Always'.",
                    preferredStyle: .alert)
                let openAction = UIAlertAction(title: "Open Settings", style: .default) { (action) in
                    if let url = URL(string:UIApplicationOpenSettingsURLString) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                }
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                alertController.addAction(cancelAction)
                alertController.addAction(openAction)
                self.present(alertController, animated: true, completion: nil)
            
        }
        if !(CLLocationManager.locationServicesEnabled()) {
            let alertController = UIAlertController(
                title: "Location Services Disabled",
                message: "In order to determine your nearest store, please open Settings and turn on Location Services",
                preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
            self.present(alertController, animated: true, completion: nil)
            
        }
        
        // Ideally we would have code to find the nearest store and load its info. Hard code for now.
        let item1 = Item(name: "TOBLERONE MILK CHOC", image: UIImage(named: "Toblerone")!)!
        let item2 = Item(name: "CLOROX CLEANER", image: UIImage(named: "Clorox")!)!
        let item3 = Item(name: "SKITTLES", image: UIImage(named: "Skittles")!)!
        let item4 = Item(name: "KIMCHI FRIED RICE", barcode: "0012345678905", image: UIImage(named: "KimchiFriedRice")!)!
        let exampleProductList:[Item:Float] = [item1:1.50, item2:3.99, item3:2.00, item4:9.99]
        let exampleStore = Store(name: "Target", address: "", productList: exampleProductList)!
        store = exampleStore
    
        // Do any additional setup after loading the view.
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
    
    
    // MARK: CLLocationManagerDelegate
    func locationManager(_:CLLocationManager, didUpdateLocations locations:[CLLocation]){
        let latestLocation = locations.last! as CLLocation
        let center = CLLocationCoordinate2D(latitude: latestLocation.coordinate.latitude, longitude: latestLocation.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001))
        
        self.mapView.setRegion(region, animated: true)
        
        
    }
    func locationManager(_:CLLocationManager, didFailWithError: Error) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender:Any?){
        print("Segue to store")
        if segue.identifier == "StoreViewSegue" {
            let nav = segue.destination as! UINavigationController
            let storeVC = nav.viewControllers.first as! StoreViewController
            storeVC.store = self.store
        }
    }
    
    //MARK: Actions
    @IBAction func didLogout(_ sender: UIBarButtonItem) {
        let firebaseAuth = FIRAuth.auth()
        do {
            try firebaseAuth?.signOut()
//            AppState.sharedInstance.signedIn = false
            dismiss(animated: true, completion: nil)
        } catch let signOutError as NSError {
            print ("Error signing out: \(signOutError.localizedDescription)")
        }
    }
    



}
