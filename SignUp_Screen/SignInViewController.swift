//
//  SignInViewController.swift
//  SignUp Screen
//
//  Created by iOS Dev2 on 21/04/20.
//  Copyright © 2020 iOS Dev2. All rights reserved.
//

import UIKit
import ProgressHUD

class SignInViewController: UIViewController {
    
        @IBOutlet var IBLblTitle: UILabel!
        @IBOutlet var IBViewEmail: UIView!
        @IBOutlet var IBTxtFldEmail: UITextField!
        @IBOutlet var IBViewPassword: UIView!
        @IBOutlet var IBTxtfldPassword: UITextField!
        @IBOutlet var IBBtnSignIn: UIButton!
        @IBOutlet var IBBtnSignUp: UIButton!
        @IBOutlet var IBBtnForgetPassword: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    func setupUI() {
        
        setupTitleLabel()
        setupEmailTextField()
        setupPasswordTextField()
        setupSignUpButton()
        setupSignInButton()
        
    }

    @IBAction func dismissAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func IBBtnSignInTapped(_ sender: Any) {
        self.view.endEditing(true)
             self.validateFields()
//        self.navigationController?.popViewController(animated: true)
             self.signIn(onSuccess: {
                
             }) { (errorMessage) in
                
                 ProgressHUD.showError(errorMessage)
             }
    }
}
