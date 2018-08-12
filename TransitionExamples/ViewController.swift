//
//  ViewController.swift
//  TransitionExamples
//
//  Created by Onur Hüseyin Çantay on 12.08.2018.
//  Copyright © 2018 Onur Hüseyin Çantay. All rights reserved.
//

import UIKit

class ViewController: UIViewController,Transitionable,UIViewControllerTransitioningDelegate{
    
    let circleTransition = CircularTransition()
    
    
    
    @IBOutlet private weak var circularButton : UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        circularButton.layer.cornerRadius = circularButton.frame.width/2
    }
    @IBAction func CircularButtonTouched(_ sender : UIButton){
        self.performTransition(name: "CircularViewControllerSegue")
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        circleTransition.transitionMode = .dismiss
        circleTransition.startingPoint = circularButton.center
        circleTransition.circleColor = circularButton.backgroundColor!
        return circleTransition
    }
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        circleTransition.transitionMode = .present
        circleTransition.startingPoint = circularButton.center
        circleTransition.circleColor = circularButton.backgroundColor!
        return circleTransition
    }
    func performTransition(name: String) {
        self.performSegue(withIdentifier: name, sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let segueVC = segue.destination as? CircularViewController{
            segueVC.transitioningDelegate = self
            segueVC.modalPresentationStyle = .custom
        }
    }
}
protocol Transitionable {
    func performTransition(name:String)
}
