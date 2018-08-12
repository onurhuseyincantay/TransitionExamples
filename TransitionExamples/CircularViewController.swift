//
//  CircularViewController.swift
//  TransitionExamples
//
//  Created by Onur Hüseyin Çantay on 12.08.2018.
//  Copyright © 2018 Onur Hüseyin Çantay. All rights reserved.
//

import UIKit

class CircularViewController: UIViewController {
    @IBOutlet private weak var dismissButton : UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        dismissButton.layer.cornerRadius = dismissButton.frame.width/2
    }
    
    @IBAction func dismissButtonTouched(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
