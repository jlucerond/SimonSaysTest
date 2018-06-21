//
//  SplashScreenViewController.swift
//  SimonSaysTest
//
//  Created by Joe Lucero on 6/21/18.
//  Copyright © 2018 Joe Lucero. All rights reserved.
//

import UIKit

class SplashScreenViewController: UIViewController {
   
   @IBOutlet weak var splashScreenButton: UIButton!
   @IBOutlet weak var redView: UIView!
   @IBOutlet weak var yellowView: UIView!
   @IBOutlet weak var greenView: UIView!
   @IBOutlet weak var blueView: UIView!
   
   @IBOutlet weak var redButtonLeftConstraint: NSLayoutConstraint!
   
   override func viewDidLoad() {
      super.viewDidLoad()
      splashScreenButton.layer.cornerRadius = splashScreenButton.bounds.height/2
      splashScreenButton.layer.borderColor = UIColor.darkGray.cgColor
      splashScreenButton.layer.borderWidth = 10.0
      splashScreenButton.layer.shadowColor = UIColor.purple.cgColor
      splashScreenButton.layer.shadowRadius = 10.0
      splashScreenButton.layer.shadowOpacity = 1.0
   }
   
   override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(animated)

      animateRedView()
      animateGreenView()
      animateYellowView()
      animateBlueView()
   }
 
   func animateRedView() {
      UIView.animate(withDuration: 1.0, delay: 0, options: [.repeat], animations: {
         self.redButtonLeftConstraint.constant += self.view.bounds.width
         self.view.layoutIfNeeded()
      }, completion: nil)
   }
   
   func animateGreenView() {
      UIView.animate(withDuration: 1.31, delay: 0, options: [.repeat, .curveLinear], animations: {
         self.greenView.center = CGPoint(x: self.greenView.center.x + self.view.bounds.width, y: self.greenView.center.y)
         self.view.layoutIfNeeded()
      }, completion: nil)
   }
   
   func animateYellowView() {
      UIView.animate(withDuration: 3.22, delay: 0, options: [.curveLinear, .repeat], animations: {
         self.yellowView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
         self.yellowView.center = CGPoint(x: self.yellowView.center.x - self.view.bounds.width, y: self.yellowView.center.y)
         self.view.layoutIfNeeded()
      }, completion: nil)
   }
   
   func animateBlueView() {
      UIView.animateKeyframes(withDuration: 4.9, delay: 0, options: [.repeat, .autoreverse], animations: {
         UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5, animations: {
            self.blueView.transform = CGAffineTransform(scaleX: 2, y: 2)
         })
         
         UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5, animations: {
            self.blueView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
         })
         
         UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25, animations: {
            self.blueView.center = CGPoint(x: 0.75 * self.view.bounds.width, y: self.blueView.center.y + 20)
         })
         
         UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
            self.blueView.center = CGPoint(x: 0.5 * self.view.bounds.width, y: self.blueView.center.y - 40)
         })
         
         UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25, animations: {
            self.blueView.center = CGPoint(x: 0.25 * self.view.bounds.width, y: self.blueView.center.y + 40)
         })
         
         UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: {
            self.blueView.center = CGPoint(x: 0, y: self.blueView.center.y - 20)
         })
      }, completion: nil)
   }
   
}
