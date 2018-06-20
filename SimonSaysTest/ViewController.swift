//
//  ViewController.swift
//  SimonSaysTest
//
//  Created by Joe Lucero on 6/20/18.
//  Copyright © 2018 Joe Lucero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
   let topLeftButton = UIButton()
   let topRightButton = UIButton()
   let bottomLeftButton = UIButton()
   let bottomRightButton = UIButton()
   
   override func viewDidLoad() {
      super.viewDidLoad()      
      setUp()
   }


}

extension UIButton {
   
   open override var isHighlighted: Bool {
      didSet {
         backgroundColor = isHighlighted ? UIColor.lightGray : Constants.arrayOfColors[tag]
      }
   }
}

extension ViewController {
   func setUp() {
      setUpTopLeftButton()
      setUpTopRightButton()
      setUpBottomLeftButton()
      setUpBottomRightButton()
   }
   
   func setUpTopLeftButton() {
      // do all of these with nslayoutconstraint.isactive
      topLeftButton.tag = 0
      topLeftButton.backgroundColor = Constants.arrayOfColors[topLeftButton.tag]
      view.addSubview(topLeftButton)
      topLeftButton.translatesAutoresizingMaskIntoConstraints = false
      
      NSLayoutConstraint(item: topLeftButton,
                         attribute: .top,
                         relatedBy: .equal,
                         toItem: view,
                         attribute: .top,
                         multiplier: 1,
                         constant: 50).isActive = true
      
      NSLayoutConstraint(item: topLeftButton,
                         attribute: .bottom,
                         relatedBy: .equal,
                         toItem: view,
                         attribute: .centerY,
                         multiplier: 1,
                         constant: -25).isActive = true
      
      NSLayoutConstraint(item: topLeftButton,
                         attribute: .left,
                         relatedBy: .equal,
                         toItem: view,
                         attribute: .left,
                         multiplier: 1,
                         constant: 50).isActive = true
      
      NSLayoutConstraint(item: topLeftButton,
                         attribute: .right,
                         relatedBy: .equal,
                         toItem: view,
                         attribute: .centerX,
                         multiplier: 1,
                         constant: -25).isActive = true
      
   }

   func setUpTopRightButton() {
      topRightButton.tag = 1
      topRightButton.backgroundColor = Constants.arrayOfColors[topRightButton.tag]
      view.addSubview(topRightButton)
      topRightButton.translatesAutoresizingMaskIntoConstraints = false
      
      let topConstraint = NSLayoutConstraint(item: topRightButton,
                                            attribute: .top,
                                            relatedBy: .equal,
                                            toItem: view,
                                            attribute: .top,
                                            multiplier: 1,
                                            constant: 50)
      
      let leftConstraint = NSLayoutConstraint(item: topRightButton,
                                              attribute: .left,
                                              relatedBy: .equal,
                                              toItem: topLeftButton,
                                              attribute: .right,
                                              multiplier: 1,
                                              constant: 50)
      
      let rightConstraint = NSLayoutConstraint(item: topRightButton,
                                               attribute: .right,
                                               relatedBy: .equal,
                                               toItem: view,
                                               attribute: .right,
                                               multiplier: 1,
                                               constant: -50)
      
      let bottomConstraint = NSLayoutConstraint(item: topRightButton,
                                                attribute: .bottom,
                                                relatedBy: .equal,
                                                toItem: view,
                                                attribute: .centerY,
                                                multiplier: 1,
                                                constant: -25)
      
      view.addConstraints([topConstraint, leftConstraint, rightConstraint, bottomConstraint])
   }
   
   func setUpBottomLeftButton() {
      bottomLeftButton.tag = 2
      bottomLeftButton.backgroundColor = Constants.arrayOfColors[bottomLeftButton.tag]
      view.addSubview(bottomLeftButton)
      bottomLeftButton.translatesAutoresizingMaskIntoConstraints = false
      
      bottomLeftButton.topAnchor.constraint(equalTo: topLeftButton.bottomAnchor, constant: 50).isActive = true
      bottomLeftButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
      bottomLeftButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
      bottomLeftButton.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: -25).isActive = true
   }

   func setUpBottomRightButton() {
      bottomRightButton.tag = 3
      bottomRightButton.backgroundColor = Constants.arrayOfColors[bottomRightButton.tag]
      view.addSubview(bottomRightButton)
      bottomRightButton.translatesAutoresizingMaskIntoConstraints = false
      
      bottomRightButton.topAnchor.constraint(equalTo: topLeftButton.bottomAnchor, constant: 50).isActive = true
      bottomRightButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
      bottomRightButton.leftAnchor.constraint(equalTo: bottomLeftButton.rightAnchor, constant: 50).isActive = true
      bottomRightButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
   }
}

