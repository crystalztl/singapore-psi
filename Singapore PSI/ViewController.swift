//
//  ViewController.swift
//  Singapore PSI
//
//  Created by Zhang Tianli on 22/1/18.
//  Copyright © 2018 tianli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        PSIService.instance.getPSI(dateTime: Date()) { (psiResponse) in
        }
    }

}

