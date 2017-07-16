//
//  ViewController.swift
//  PinboardPins
//
//  Created by Irshad on 15/07/17.
//  Copyright © 2017 MindValley. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        loginLabel.alpha = 0.0
        emailTextField.alpha = 0.0
        passwordTextField.alpha = 0.0
        loginButton.alpha = 0.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        UIView.animate(withDuration: 1.0, delay: 1.0,
                       options: [],
                       animations: {
                        self.loginLabel.alpha = 1.0
                        self.emailTextField.alpha = 1.0
                        self.passwordTextField.alpha = 1.0
                        self.loginButton.alpha = 1.0
        }, completion: nil)
        
    }
    
    
    @IBAction func logInTapped(_ sender: Any) {
        displaySuccessMessage(message: "Login Successfully")
        self.performSegue(withIdentifier: SegueConstants.LoginSegue, sender: self)
    }
    
    @IBAction func unwindToLogin(_ segue: UIStoryboardSegue) {
    }
}

