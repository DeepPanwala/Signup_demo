//
//  SignInWithGoogle.swift
//  SignUp Screen
//
//  Created by iOS Dev2 on 22/04/20.
//  Copyright © 2020 iOS Dev2. All rights reserved.
//

import UIKit
import WebKit

class SignInWithGoogle: UIViewController {

    @IBOutlet var IBWebView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

      let url = URL(string: "https://accounts.google.com/signin/v2/identifier?service=mail&passive=true&rm=false&continue=https%3A%2F%2Fmail.google.com%2Fmail%2F&ss=1&scc=1&ltmpl=default&ltmplcache=2&emr=1&osid=1&flowName=GlifWebSignIn&flowEntry=ServiceLogin")
        let request = URLRequest(url: url!)
        
        IBWebView.load(request)

    }
    
    @IBAction func IBBtbDismiss(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
