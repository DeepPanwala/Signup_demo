//
//  SignUpViewController.swift
//  SignUp Screen
//
//  Created by iOS Dev2 on 20/04/20.
//  Copyright © 2020 iOS Dev2. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage
import ProgressHUD
import Firebase

class SignUpViewController: UIViewController {
    
    var image: UIImage? = nil

    @IBOutlet var IBLblTitle: UILabel!
    @IBOutlet var IBImgAvtar: UIImageView!
    @IBOutlet var IBViewFullName: UIView!
    @IBOutlet var IBTxtFldFullName: UITextField!
    @IBOutlet var IBViewEmail: UIView!
    @IBOutlet var IBTxtFldEmail: UITextField!
    @IBOutlet var IBViewPassword: UIView!
    @IBOutlet var IBTxtFldPassword: UITextField!
    @IBOutlet var IBBtnSighUp: UIButton!
    @IBOutlet var IBBtnSighIn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    func setupUI() {
        
        setupTitleLabel()
        setupAvtar()
        setupFullNameTextField()
        setupEmailTextField()
        setupPasswordTextField()
        setupSignUpButton()
        setupSignInButton()
        
    }
    @IBAction func dismissAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }
    
    
    
    @IBAction func IBBtnSignUpTapped(_ sender: Any) {
        
        Analytics.logEvent("SignUPButton", parameters: nil)
        
        self.view.endEditing(true)
        self.validateFields()
        
        self.signUp(onSuccess: {
            if self.IBTxtFldFullName.text == nil {
                ProgressHUD.showError("Please Enter UserName")
            }
            
            
        })
        { (errorMessage) in
            ProgressHUD.showError(errorMessage)
            
        }
        IBTxtFldEmail.text = ""
        IBTxtFldFullName.text = ""
        IBTxtFldPassword.text = ""
    }
}
