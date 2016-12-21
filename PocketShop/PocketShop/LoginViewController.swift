//
//  LoginViewController.swift
//  PocketShop
//
//  Created by Leslie Tzeng on 11/19/16.
//  Copyright © 2016 Leslie Tzeng. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func viewDidLoad() {
        if let user = FIRAuth.auth()?.currentUser {
            self.signedIn(user)
        }
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillAppear(animated)
    }
    
    // MARK: Actions
    @IBAction func tappedLogin(_ sender: UIButton) {
        guard let email = emailField.text, let password = passwordField.text else { return }
        FIRAuth.auth()?.signIn(withEmail: email, password: password) { (user, error) in
            if let error = error {
                var message = ""
                switch FIRAuthErrorCode(rawValue: error._code)! {
                    case .errorCodeWrongPassword:
                        message = "Wrong password."
                    case .errorCodeInvalidEmail:
                        message = "Email invalid."
                    case .errorCodeUserNotFound:
                        message = "User not found."
                    default:
                        message = "Login Error."
                }
                let alert = UIAlertController(title: nil,
                                              message: message, preferredStyle: .alert)
                let dismissAction = UIAlertAction(title: "Dismiss", style: .destructive, handler: nil)
                alert.addAction(dismissAction)
                self.present(alert, animated: true, completion: nil)
                print(error.localizedDescription)
                return
            }
            self.signedIn(user!)
        }
    }
    
    func signedIn(_ user: FIRUser?) {
//        MeasurementHelper.sendLoginEvent()
//        
//        AppState.sharedInstance.signedIn = true
//        let notificationName = Notification.Name(rawValue: Constants.NotificationKeys.SignedIn)
//        NotificationCenter.default.post(name: notificationName, object: nil, userInfo: nil)
        performSegue(withIdentifier: "toLocator", sender: nil)
    }
    
    
}

