//
//  ViewController.swift
//  SignUp Screen
//
//  Created by iOS Dev2 on 20/04/20.
//  Copyright © 2020 iOS Dev2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var IBLblCreateaccount: UILabel!
    @IBOutlet var IBBtnFacebook: UIButton!
    @IBOutlet var IBBtnGoogle: UIButton!
    @IBOutlet var IBLblOr: UILabel!
    @IBOutlet var IBBtnCreateAcc: UIButton!
    @IBOutlet var IBLblTerms: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        setupUI()
    }

    func setupUI() {
        
        setupHeaderTitle()
        setupOrLabel()
        setupTearmsLabel()
        setupFacebookButton()
        setupGoogleButton()
        setupCreateButton()
        
    }

}

