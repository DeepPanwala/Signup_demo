//
//  UserApi.swift
//  SignUp Screen
//
//  Created by iOS Dev2 on 22/04/20.
//  Copyright © 2020 iOS Dev2. All rights reserved.
//

import Foundation
import FirebaseAuth
import Firebase
import ProgressHUD
import FirebaseStorage

class UserApi {
    func SignIn(email: String, password: String, onSuccess: @escaping() -> Void, onError: @escaping( _ errorMessage: String) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (auth, error) in
            if error != nil{
                onError(error!.localizedDescription)
                return
            }
            print(auth?.user.uid)
            onSuccess()
        }
    }
    
    func signUp(withUsername username: String, email: String, password: String, image: UIImage?, onSuccess: @escaping() -> Void, onError: @escaping( _ errorMessage: String) -> Void ){
        
        Auth.auth().createUser(withEmail: email, password: password) { (authDataResult, error) in
            if error != nil {
                //                print(error!.localizedDescription)
                ProgressHUD.showError(error!.localizedDescription)
                return
            }
            
            if let authData = authDataResult {
                print(authData.user.email)
                var dict: Dictionary<String, Any> = [
                    "uid": authData.user.uid,
                    "email": authData.user.email,
                    "username": username,
                    "profileImageUrl": "",
                    "ststus": "Welcome"
                ]
                
                guard let imageSelected = image else {
                    
                    ProgressHUD.showError("Please choose your profile image")
                    return
                }
                guard let imageData = imageSelected.jpegData(compressionQuality: 0.4) else {
                    return
                }
                
                
                
                let storageProfile = Ref().storageSpecificProfile(uid: authData.user.uid)
                
                let metaData = StorageMetadata()
                metaData.contentType = "image/jpg"
                
                StorageServices.savePhoto(username: username, uid: authData.user.uid, data: imageData, metadata: metaData, storageProfileRef: storageProfile, dict: dict, onSuccess: {
                    onSuccess()
                }, onError: onError)
                
                
                
            }
        }
    }
    
    func resetPassword(email: String, onSuccess: @escaping() -> Void, onError: @escaping( _ errorMessage: String) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if error == nil {
                onSuccess()
            } else {
                onError(error!.localizedDescription)
            }
        }
    }
}
