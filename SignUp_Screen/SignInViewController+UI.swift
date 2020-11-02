//
//  SignInViewController+UI.swift
//  SignUp Screen
//
//  Created by iOS Dev2 on 21/04/20.
//  Copyright © 2020 iOS Dev2. All rights reserved.
//

import UIKit
import ProgressHUD

extension SignInViewController{
    func setupTitleLabel() {
                let title = "Sign In"
                    
                let attributedText =  NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.font : UIFont.init(name: "Didot", size: 28)!, NSAttributedString.Key.foregroundColor : UIColor.black])
                    
                IBLblTitle.attributedText = attributedText
        }
       
        func setupEmailTextField() {
            IBTxtFldEmail.layer.borderWidth = 0.3
            IBTxtFldEmail.layer.borderColor = UIColor.black.cgColor  //(displayP3Red: 210/255, green: 210/255, blue: 210/255, alpha: 1).cgColor
            IBTxtFldEmail.layer.cornerRadius = 5
            IBTxtFldEmail.clipsToBounds = true
        }
        func setupPasswordTextField() {
            IBTxtfldPassword.layer.borderWidth = 0.3
            IBTxtfldPassword.layer.borderColor = UIColor.black.cgColor  //(displayP3Red: 210/255, green: 210/255, blue: 210/255, alpha: 1).cgColor
            IBTxtfldPassword.layer.cornerRadius = 5
            IBTxtfldPassword.clipsToBounds = true
        }
        func setupSignInButton() {
            IBBtnSignIn.setTitle("Sign In", for: UIControl.State.normal);
            IBBtnSignIn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
            IBBtnSignIn.backgroundColor = UIColor.black
            IBBtnSignIn.layer.cornerRadius = 8
            IBBtnSignIn.clipsToBounds = true
            IBBtnSignIn.tintColor = UIColor.white
        }
        func setupSignUpButton() {
            let attributedText =  NSMutableAttributedString(string: "Don't have an account?  ", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor : UIColor(white: 0, alpha: 0.65)])
            
            let attributedsubText =  NSMutableAttributedString(string: "Sign Up", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18), NSAttributedString.Key.foregroundColor : UIColor.black])
            
            attributedText.append(attributedsubText)
            IBBtnSignUp.setAttributedTitle(attributedText, for: UIControl.State.normal)
    //        IBLblTerms.attributedText = attributedTermsText
    //        IBLblTerms.numberOfLines = 0
        }
    
    func validateFields(){
        guard let email = self.IBTxtFldEmail.text, !email.isEmpty else {
            ProgressHUD.showError("Please enter an email address")
            return
        }
        guard let password = self.IBTxtfldPassword.text, !password.isEmpty else {
            ProgressHUD.showError("Please enter a password")
            return
        }
    }
    
    func signIn(onSuccess: @escaping() -> Void, onError: @escaping( _ errorMessage: String) -> Void){
       
        ProgressHUD.show()
        Api.User.SignIn(email: self.IBTxtFldEmail.text!, password: self.IBTxtfldPassword.text!, onSuccess: {
            self.view.endEditing(true)
            ProgressHUD.showSuccess("SignIn Successfully Complete")
            self.IBTxtFldEmail.text = ""
            self.IBTxtfldPassword.text = ""
//            ProgressHUD.dismiss()
      
//            self.navigationController?.popViewController(animated: true)
            
            
        }) { (errorMessage) in
            onError(errorMessage)
        }
        
    }
}
