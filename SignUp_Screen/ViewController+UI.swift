//
//  ViewController+UI.swift
//  SignUp Screen
//
//  Created by iOS Dev2 on 20/04/20.
//  Copyright © 2020 iOS Dev2. All rights reserved.
//

import UIKit

extension ViewController{
    
  func setupHeaderTitle() {
      let title = "Create a new account"
              let subTitle = "\n\nThere are many options to create your account"
              
              let attributedText =  NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.font : UIFont.init(name: "Didot", size: 28)!, NSAttributedString.Key.foregroundColor : UIColor.black])
              
              let attributedsubTitle =  NSMutableAttributedString(string: subTitle, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor : UIColor.init(white: 0, alpha: 0.45)])
              
              attributedText.append(attributedsubTitle)
              
      //        let paragrapStyle = NSMutableParagraphStyle()
      //        paragrapStyle.lineSpacing = 5
      //
      //        attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragrapStyle, range: NSMakeRange(0, attributedText.length))
      //
              IBLblCreateaccount.numberOfLines = 0
              IBLblCreateaccount.attributedText = attributedText

  }
    
    func setupOrLabel() {
        IBLblOr.text = "Or"
        IBLblOr.font = UIFont.boldSystemFont(ofSize: 18)
        IBLblOr.textColor = UIColor.init(white: 0, alpha: 0.45)
        IBLblOr.textAlignment = .center
    }
    
    func setupTearmsLabel() {
        let attributedTermsText =  NSMutableAttributedString(string: "By clicking 'Create a new account' you agree to our", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor : UIColor(white: 0, alpha: 0.65)])
        
        let attributedsubTermsText =  NSMutableAttributedString(string: "\nTerms of service.", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor : UIColor.init(white: 0, alpha: 1)])
        
        attributedTermsText.append(attributedsubTermsText)
        
        IBLblTerms.attributedText = attributedTermsText
        IBLblTerms.numberOfLines = 0
    }
    
    func setupFacebookButton() {
        IBBtnFacebook.setTitle("Sign in with Facebok", for: UIControl.State.normal);
                
                IBBtnFacebook.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
                IBBtnFacebook.backgroundColor = UIColor(displayP3Red: 58/255, green: 85/255, blue: 159/255, alpha: 1)
                
                IBBtnFacebook.layer.cornerRadius = 8
                IBBtnFacebook.clipsToBounds = true
        //        IBBtnFacebook.setImage(UIImage.init(named: "59439"), for: .normal)
        //        IBBtnFacebook.imageView?.contentMode = .scaleAspectFit
        //        IBBtnFacebook.tintColor = .white
        //        IBBtnFacebook.imageEdgeInsets = UIEdgeInsets(top: 12, left: -15, bottom: 12, right: 10)
    }
    
    func setupGoogleButton() {
        IBBtnGoogle.setTitle("Sign in with Google", for: UIControl.State.normal);
                IBBtnGoogle.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
                IBBtnGoogle.backgroundColor = UIColor(displayP3Red: 223/255, green: 74/255, blue: 50/255, alpha: 1)
                IBBtnGoogle.layer.cornerRadius = 8
                IBBtnGoogle.clipsToBounds = true
        //        IBBtnGoogle.setImage(UIImage.init(named: "181-1814835_google-logo-png-circle-google-icon-png-white"), for: UIControl.State.normal)
        //        IBBtnGoogle.imageView?.contentMode = .scaleAspectFit
        //        IBBtnGoogle.tintColor = .white
        //        IBBtnGoogle.imageEdgeInsets = UIEdgeInsets(top: 12, left: -200, bottom: 12, right: 0)
    }
    
    func setupCreateButton() {
        IBBtnCreateAcc.setTitle("Create a new account", for: UIControl.State.normal);
        IBBtnCreateAcc.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        IBBtnCreateAcc.backgroundColor = UIColor.black
        IBBtnCreateAcc.layer.cornerRadius = 8
        IBBtnCreateAcc.clipsToBounds = true
        
    }
    
}
