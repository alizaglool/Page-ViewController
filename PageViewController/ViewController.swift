//
//  ViewController.swift
//  PageViewController
//
//  Created by A_Z on 6/30/22.
//  Copyright © 2022 AliZ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UITextView!
    var pagetitle : String? , pageDescrption : String?
    var pageColor : UIColor?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let Title = pagetitle {
          lblTitle.text = Title
        }
        if let Descripyion = pageDescrption {
            lblDescription.text = Descripyion
        }
        if let Color = pageColor {
            self.view.backgroundColor = Color
        }
        
    }


}

