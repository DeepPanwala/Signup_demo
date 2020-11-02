//
//  ForgotPasswordViewController.swift
//  SignUp Screen
//
//  Created by iOS Dev2 on 21/04/20.
//  Copyright © 2020 iOS Dev2. All rights reserved.
//

import UIKit
import ProgressHUD

class ForgotPasswordViewController: UIViewController {
    
    @IBOutlet var IBLblTitle: UILabel!
    @IBOutlet var IBViewEmail: UIView!
    @IBOutlet var IBTxtFldEmail: UITextField!
    @IBOutlet var IBBtnForgotPassword: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
            
    }
        func setupUI() {
            
            setupTitleLabel()
            setupEmailTextField()
            setupForgotButton()
            
        }
    @IBAction func dismissAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func IBBtnForgetPasswordTapped(_ sender: Any) {
        guard let email = IBTxtFldEmail.text, email != "" else{
            ProgressHUD.showError("Please enter an email address for password reset.")
            return
        }
        Api.User.resetPassword(email: email, onSuccess: {
            self.view.endEditing(true)
            ProgressHUD.showSuccess("We have just send you a password reset email. Please check your inbox and follow the instructions to reset your password.")
            self.navigationController?.popViewController(animated: true)
        }) { (errorMessage) in
            ProgressHUD.showError(errorMessage)
        }
    }
}
