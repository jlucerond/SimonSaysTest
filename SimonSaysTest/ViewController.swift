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
   let grayView = UIView()
   
   let displayLabel = UILabel()
   let margin: CGFloat = 50
   
   let game = GamePlay()
   var isGameOver = false
   
   override func viewDidLoad() {
      super.viewDidLoad()      
      setUp()
   }
   
   override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(animated)
      
      game.startNewGame()
      showSequenceOfPresses()
   }
//
//   override func viewWillLayoutSubviews() {
//      grayView.frame = CGRect(x: 0, y: view.bounds.height - margin, width: view.bounds.width, height: margin)
//   }
   
   func showSequenceOfPresses() {
      view.isUserInteractionEnabled = false
      var count = 1.0
      
      for move in game.correctMoves {
         
         var color: String
         switch move {
         case 0:
            color = "red"
         case 1:
            color = "yellow"
         case 2:
            color = "green"
         case 3:
            color = "blue"
         default:
            color = "unknown"
         }
         
         show("\(color)", after: count)
         count += 1
      }
      
   }
   
   func show(_ text: String, after delay: Double) {
      DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
         self.view.isUserInteractionEnabled = false
         self.displayLabel.alpha = 1
         self.displayLabel.text = text
         UIView.animate(withDuration: 1.0, animations: {
            self.displayLabel.alpha = 0
         })
         self.view.isUserInteractionEnabled = true
      }
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
      setUpBottomView()
      setUpTopLeftButton()
      setUpTopRightButton()
      setUpBottomLeftButton()
      setUpBottomRightButton()
   }
   
   @objc func buttonTapped(_ sender: UIButton) {
      guard !isGameOver else {
         isGameOver = false
         displayLabel.text = ""
         game.startNewGame()
         showSequenceOfPresses()
         return
      }
      
      let response = game.userSelected(sender.tag)
      
      if response == .correctAndContinue {
         show("Correct", after: 0)
      } else if response == .correctAndNewRound {
         show("Correct, time for new round!", after: 0)
         showSequenceOfPresses()
         
      } else if response == .incorrect {
         displayLabel.alpha = 1
         displayLabel.text = "You lost. Press any button to start again"
         isGameOver = true
      }
   }
   
   func setUpBottomView() {
      grayView.backgroundColor = UIColor.lightGray
      view.addSubview(grayView)
      
      displayLabel.text = ""
      displayLabel.translatesAutoresizingMaskIntoConstraints = false
      grayView.addSubview(displayLabel)
      displayLabel.centerXAnchor.constraint(equalTo: grayView.centerXAnchor).isActive = true
      displayLabel.centerYAnchor.constraint(equalTo: grayView.centerYAnchor).isActive = true
      
      grayView.translatesAutoresizingMaskIntoConstraints = false
//      grayView.frame = CGRect(x: 0, y: view.bounds.height - margin, width: view.bounds.width, height: margin)

      grayView.heightAnchor.constraint(equalToConstant: margin).isActive = true
      grayView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
      grayView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
      grayView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
   }
   
   func setUpTopLeftButton() {
      // do all of these with nslayoutconstraint.isactive
      topLeftButton.tag = 0
      topLeftButton.backgroundColor = Constants.arrayOfColors[topLeftButton.tag]
      topLeftButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
      view.addSubview(topLeftButton)
      topLeftButton.translatesAutoresizingMaskIntoConstraints = false
      
      NSLayoutConstraint(item: topLeftButton,
                         attribute: .top,
                         relatedBy: .equal,
                         toItem: view,
                         attribute: .top,
                         multiplier: 1,
                         constant: margin).isActive = true
      
      NSLayoutConstraint(item: topLeftButton,
                         attribute: .bottom,
                         relatedBy: .equal,
                         toItem: view,
                         attribute: .centerY,
                         multiplier: 1,
                         constant: -margin).isActive = true
      
      NSLayoutConstraint(item: topLeftButton,
                         attribute: .left,
                         relatedBy: .equal,
                         toItem: view,
                         attribute: .left,
                         multiplier: 1,
                         constant: margin).isActive = true
      
      NSLayoutConstraint(item: topLeftButton,
                         attribute: .right,
                         relatedBy: .equal,
                         toItem: view,
                         attribute: .centerX,
                         multiplier: 1,
                         constant: -margin/2).isActive = true
      
   }
   
   func setUpTopRightButton() {
      topRightButton.tag = 1
      topRightButton.backgroundColor = Constants.arrayOfColors[topRightButton.tag]
      view.addSubview(topRightButton)
      topRightButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
      topRightButton.translatesAutoresizingMaskIntoConstraints = false
      
      let topConstraint = NSLayoutConstraint(item: topRightButton,
                                             attribute: .top,
                                             relatedBy: .equal,
                                             toItem: view,
                                             attribute: .top,
                                             multiplier: 1,
                                             constant: margin)
      
      let leftConstraint = NSLayoutConstraint(item: topRightButton,
                                              attribute: .left,
                                              relatedBy: .equal,
                                              toItem: topLeftButton,
                                              attribute: .right,
                                              multiplier: 1,
                                              constant: margin)
      
      let rightConstraint = NSLayoutConstraint(item: topRightButton,
                                               attribute: .right,
                                               relatedBy: .equal,
                                               toItem: view,
                                               attribute: .right,
                                               multiplier: 1,
                                               constant: -margin)
      
      let bottomConstraint = NSLayoutConstraint(item: topRightButton,
                                                attribute: .bottom,
                                                relatedBy: .equal,
                                                toItem: view,
                                                attribute: .centerY,
                                                multiplier: 1,
                                                constant: -margin)
      
      view.addConstraints([topConstraint, leftConstraint, rightConstraint, bottomConstraint])
   }
   
   func setUpBottomLeftButton() {
      bottomLeftButton.tag = 2
      bottomLeftButton.backgroundColor = Constants.arrayOfColors[bottomLeftButton.tag]
      view.addSubview(bottomLeftButton)
      bottomLeftButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
      bottomLeftButton.translatesAutoresizingMaskIntoConstraints = false
      
      bottomLeftButton.topAnchor.constraint(equalTo: topLeftButton.bottomAnchor, constant: margin).isActive = true
      bottomLeftButton.bottomAnchor.constraint(equalTo: grayView.topAnchor, constant: -margin).isActive = true
      bottomLeftButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: margin).isActive = true
      bottomLeftButton.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: -margin/2).isActive = true
   }
   
   func setUpBottomRightButton() {
      bottomRightButton.tag = 3
      bottomRightButton.backgroundColor = Constants.arrayOfColors[bottomRightButton.tag]
      view.addSubview(bottomRightButton)
      bottomRightButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
      bottomRightButton.translatesAutoresizingMaskIntoConstraints = false
      
      bottomRightButton.topAnchor.constraint(equalTo: topLeftButton.bottomAnchor, constant: margin).isActive = true
      bottomRightButton.bottomAnchor.constraint(equalTo: bottomLeftButton.bottomAnchor).isActive = true
      bottomRightButton.leftAnchor.constraint(equalTo: bottomLeftButton.rightAnchor, constant: margin).isActive = true
      bottomRightButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -margin).isActive = true
   }
   
}

