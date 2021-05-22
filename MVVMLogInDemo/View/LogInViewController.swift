//
//  ViewController.swift
//  MVVMLogInDemo
//
//  Created by Prashant Gaikwad on 21/05/21.
//

import UIKit

class LogInViewController: UIViewController {
    
    //MARK:- Properties
    let loginVm = LogInViewModel()

    //MARK:- IBOutlets
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //MARK:- LifeCycle Action
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK:- IBAction
    @IBAction func loginAction(_ sender: Any) {
        loginVm.loginUser(userNameTextField.text, password: passwordTextField.text)
        loginVm.loginCompletionHandler { [weak self] (status, message) in
            self?.messageLabel.text = message
        }
    }
}
