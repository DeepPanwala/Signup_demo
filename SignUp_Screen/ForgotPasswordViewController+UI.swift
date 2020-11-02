//
//  ForgotPasswordViewController+UI.swift
//  SignUp Screen
//
//  Created by iOS Dev2 on 21/04/20.
//  Copyright © 2020 iOS Dev2. All rights reserved.
//

import UIKit

extension ForgotPasswordViewController{
    func setupTitleLabel() {
                let title = "Forgot Password"
                    
                let attributedText =  NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.font : UIFont.init(name: "Didot", size: 28)!, NSAttributedString.Key.foregroundColor : UIColor.black])
                    
                IBLblTitle.attributedText = attributedText
        }
       
        func setupEmailTextField() {
           IBTxtFldEmail.layer.borderWidth = 0.3
            IBTxtFldEmail.layer.borderColor = UIColor.black.cgColor  //(displayP3Red: 210/255, green: 210/255, blue: 210/255, alpha: 1).cgColor
            IBTxtFldEmail.layer.cornerRadius = 5
            IBTxtFldEmail.clipsToBounds = true
        }
        
        func setupForgotButton() {
            IBBtnForgotPassword.setTitle("Reset My Password", for: UIControl.State.normal);
            IBBtnForgotPassword.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
            IBBtnForgotPassword.backgroundColor = UIColor.black
            IBBtnForgotPassword.layer.cornerRadius = 8
            IBBtnForgotPassword.clipsToBounds = true
            IBBtnForgotPassword.tintColor = UIColor.white
        }
        
}
