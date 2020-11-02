//
//  SignInWithFacebook.swift
//  SignUp Screen
//
//  Created by iOS Dev2 on 22/04/20.
//  Copyright © 2020 iOS Dev2. All rights reserved.
//

import UIKit
import WebKit

class SignInWithFacebook: UIViewController {

    @IBOutlet var IBWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "https://www.facebook.com/")
               let request = URLRequest(url: url!)
               
               IBWebView.load(request)
    }
  
    @IBAction func IBBtnDismiss(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
