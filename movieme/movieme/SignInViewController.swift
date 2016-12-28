//
//  SignInViewController.swift
//  movieme
//
//  Created by psycho on 12/26/16.
//  Copyright © 2016 movieme. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var fail: UILabel!

    @IBAction func doSignIn(sender: AnyObject) {
        guard let email = self.email.text else {
            self.fail.hidden = false
            return
        }

        guard let password = self.password.text else {
            self.fail.hidden = false
            return
        }

        if (email != "iosuser" || password != "iosuser") {
            self.fail.hidden = false
            return
        }

        self.fail.hidden = true
        let nextScene = self.storyboard?.instantiateViewControllerWithIdentifier("TabBarController") as! UITabBarController
        self.showViewController(nextScene, sender: nil)
    }
}
