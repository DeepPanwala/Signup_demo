//
//  SighUpViewController+UI.swift
//  SignUp Screen
//
//  Created by iOS Dev2 on 20/04/20.
//  Copyright © 2020 iOS Dev2. All rights reserved.
//

import UIKit
import ProgressHUD

extension SignUpViewController {
    func setupTitleLabel() {
            let title = "Sign Up"
                
            let attributedText =  NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.font : UIFont.init(name: "Didot", size: 28)!, NSAttributedString.Key.foregroundColor : UIColor.black])
                
            IBLblTitle.attributedText = attributedText
    }
    func setupAvtar(){
        IBImgAvtar.layer.cornerRadius = 40
        IBImgAvtar.clipsToBounds = true
        IBImgAvtar.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(presentPicker))
        IBImgAvtar.addGestureRecognizer(tapGesture)
        
    }
    @objc func presentPicker(){
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }
    func setupFullNameTextField() {
        IBTxtFldFullName.layer.borderWidth = 0.3
        IBTxtFldFullName.layer.borderColor = UIColor.black.cgColor  //(displayP3Red: 210/255, green: 210/255, blue: 210/255, alpha: 1).cgColor
        IBTxtFldFullName.layer.cornerRadius = 5
        IBTxtFldFullName.clipsToBounds = true

    }
    func setupEmailTextField() {
        IBTxtFldEmail.layer.borderWidth = 0.3
        IBTxtFldEmail.layer.borderColor = UIColor.black.cgColor  //(displayP3Red: 210/255, green: 210/255, blue: 210/255, alpha: 1).cgColor
        IBTxtFldEmail.layer.cornerRadius = 5
        IBTxtFldEmail.clipsToBounds = true
    }
    func setupPasswordTextField() {
        IBTxtFldPassword.layer.borderWidth = 0.3
        IBTxtFldPassword.layer.borderColor = UIColor.black.cgColor  //(displayP3Red: 210/255, green: 210/255, blue: 210/255, alpha: 1).cgColor
        IBTxtFldPassword.layer.cornerRadius = 5
        IBTxtFldPassword.clipsToBounds = true
    }
    func setupSignUpButton() {
        IBBtnSighUp.setTitle("Sign Up", for: UIControl.State.normal);
        IBBtnSighUp.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        IBBtnSighUp.backgroundColor = UIColor.black
        IBBtnSighUp.layer.cornerRadius = 8
        IBBtnSighUp.clipsToBounds = true
        IBBtnSighUp.tintColor = UIColor.white
    }
    func setupSignInButton() {
        let attributedText =  NSMutableAttributedString(string: "Already have an account?  ", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor : UIColor(white: 0, alpha: 0.65)])
        
        let attributedsubText =  NSMutableAttributedString(string: "Sign In", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18), NSAttributedString.Key.foregroundColor : UIColor.black])
        
        attributedText.append(attributedsubText)
        IBBtnSighIn.setAttributedTitle(attributedText, for: UIControl.State.normal)
//        IBLblTerms.attributedText = attributedTermsText
//        IBLblTerms.numberOfLines = 0
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    
    func validateFields(){
        if self.IBTxtFldFullName.text == nil {
        guard let username = self.IBTxtFldFullName.text, !username.isEmpty else {
            ProgressHUD.showError("Please enter an username")
            return
        }
    }
        
        guard let email = self.IBTxtFldEmail.text, !email.isEmpty else {
            ProgressHUD.showError("Please enter an email address")
            return
        }
        guard let password = self.IBTxtFldPassword.text, !password.isEmpty else {
            ProgressHUD.showError("Please enter a password")
            return
        }
    }
    
    func signUp(onSuccess: @escaping() -> Void, onError: @escaping( _ errorMessage: String) -> Void){
       
        ProgressHUD.show()
        Api.User.signUp(withUsername: self.IBTxtFldFullName.text!, email: self.IBTxtFldEmail.text!, password: self.IBTxtFldPassword.text!, image: self.image, onSuccess: {
            ProgressHUD.dismiss()
            print("Done")
            onSuccess()
        }) { (errorMessage) in
            onError(errorMessage)
        }
    }
}
extension SignUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imageSelected = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            image = imageSelected
            IBImgAvtar.image = imageSelected
        }
        if let imageOriginal = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            image = imageOriginal
            IBImgAvtar.image = imageOriginal
        }
        picker.dismiss(animated: true, completion: nil)

    }
}
