//
//  ViewController.swift
//  StacksOfViews
//
//  Created by Peter Buerer on 3/6/16.
//  Copyright © 2016 Peter Buerer. All rights reserved.
//

import UIKit

class StackOverflowController: StackContainerController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(addButton)
        view.addSubview(removeButton)
        view.backgroundColor = UIColor.whiteColor()
        
        NSLayoutConstraint(item: addButton, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1.0, constant: -16.0).active = true
        NSLayoutConstraint(item: addButton, attribute: .Left, relatedBy: .Equal, toItem: view, attribute: .Left, multiplier: 1.0, constant: 16.0).active = true
        
        NSLayoutConstraint(item: removeButton, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1.0, constant: -16.0).active = true
        NSLayoutConstraint(item: removeButton, attribute: .Right, relatedBy: .Equal, toItem: view, attribute: .Right, multiplier: 1.0, constant: -16.0).active = true
    }
    
    //==========================================================================
    // MARK: - Actions
    //==========================================================================
    
    func pushArrangedSubview() {
        let label = UILabel()
        label.text = "View \(container.arrangedSubviews.count + 1)"
        label.textAlignment = .Center
        //make a random text color
        label.textColor = UIColor(red: CGFloat(Float(arc4random()) / Float(UINT32_MAX)), green: CGFloat(Float(arc4random()) / Float(UINT32_MAX)), blue: CGFloat(Float(arc4random()) / Float(UINT32_MAX)), alpha: 1.0)
        
        //inserts the view so that it shows up on top of the other views
        container.insertArrangedSubview(label, atIndex: 0)
    }

    func popArrangedSubview() {
        if let lastView = container.arrangedSubviews.first {
            //removes the view from the arranged views array but not from the stack view's subviews array
            container.removeArrangedSubview(lastView)
            //to have to view not show up on screen: either set it to hidden or call removeFromSuperview() on it
            lastView.removeFromSuperview()
        }
    }
    
    //==========================================================================
    // MARK: - Views
    //==========================================================================
   
    lazy var addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Add View", forState: .Normal)
        button.setTitleColor(UIColor.blackColor(), forState: .Normal)
        
        button.addTarget(self, action: Selector("pushArrangedSubview"), forControlEvents: .TouchUpInside)
        return button
    }()
    
    lazy var removeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Remove View", forState: .Normal)
        button.setTitleColor(UIColor.blackColor(), forState: .Normal)
        
        button.addTarget(self, action: Selector("popArrangedSubview"), forControlEvents: .TouchUpInside)
        return button
    }()
}

