//
//  Ref.swift
//  SignUp Screen
//
//  Created by iOS Dev2 on 22/04/20.
//  Copyright © 2020 iOS Dev2. All rights reserved.
//

import Foundation
import Firebase

let REF_USER = "users"
let URL_STORAGE_ROOT = "gs://jchat-4a3aa.appspot.com"
let STORAGE_PROFILE = "profile"
class Ref {
    let databaseRoot: DatabaseReference = Database.database().reference()
    
    var databaseUser: DatabaseReference {
        return databaseRoot.child(REF_USER)
    }
    let storageRoot = Storage.storage().reference(forURL: URL_STORAGE_ROOT)
    
    var storageProfile: StorageReference{
        return storageRoot.child(STORAGE_PROFILE)
    }
    func storageSpecificProfile(uid: String) -> StorageReference {
        return storageProfile.child(uid)
    }
}
