//
//  StorageServices.swift
//  SignUp Screen
//
//  Created by iOS Dev2 on 22/04/20.
//  Copyright © 2020 iOS Dev2. All rights reserved.
//

import Foundation
import FirebaseStorage
import FirebaseDatabase
import FirebaseAuth
import ProgressHUD


class StorageServices {
    static func savePhoto(username: String, uid: String, data: Data, metadata: StorageMetadata, storageProfileRef: StorageReference, dict: Dictionary<String,Any>, onSuccess: @escaping() -> Void, onError: @escaping( _ errorMessage: String) -> Void){
        storageProfileRef.putData(data, metadata: metadata) { (storageMetaData, error) in
            if error != nil {
                onError(error!.localizedDescription)
                return
            }
            
            storageProfileRef.downloadURL { (url, error) in
                if let metaImageUrl = url?.absoluteString{
                    
                    if let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest(){
                        changeRequest.photoURL = url
                        changeRequest.displayName = username
                        changeRequest.commitChanges { (error) in
                            if let error = error {
                                ProgressHUD.showError(error.localizedDescription)
                            }
                        }
                    }
                    
                    var dictTemp = dict
                    dictTemp["profileImageUrl"] = metaImageUrl
                    
                    Database.database().reference().child("users").child(uid).updateChildValues(dictTemp, withCompletionBlock:  { (error, ref) in
                        if error == nil {
                            
                            onSuccess()
                        } else{
                            onError(error!.localizedDescription)
                        }
                    }
                    )
                }
            }
            
            
        }
    }
}
