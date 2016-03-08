//
//  StackYourOwnAdventureController.swift
//  StacksOfViews
//
//  Created by Peter Buerer on 3/6/16.
//  Copyright © 2016 Peter Buerer. All rights reserved.
//

import UIKit

class StackYourOwnAdventureController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = "Stack Your Own Adventure"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = UIColor.whiteColor()
        view.addSubview(menuStack)
       
        menuStack.addArrangedSubview(distributionButton)
        menuStack.addArrangedSubview(alignmentButton)
        menuStack.addArrangedSubview(stackOverflowButton)
       
        let views = ["menu": menuStack]
        NSLayoutConstraint.activateConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[menu]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views))
        NSLayoutConstraint.activateConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[menu]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views))
        NSLayoutConstraint(item: menuStack, attribute: .Top, relatedBy: .Equal, toItem: topLayoutGuide, attribute: .Bottom, multiplier: 1.0, constant: 0.0).active = true
    }
   
    //==========================================================================
    // MARK: - Actions
    //==========================================================================
    
    func showStackOverflow() {
        navigationController?.pushViewController(StackOverflowController(), animated: true)
    }

    func showAlignment() {
        navigationController?.pushViewController(StackAlignmentController(), animated: true)
    }
    
    func showDistribution() {
        navigationController?.pushViewController(StackDistributionController(), animated: true)
    }
    
    //==========================================================================
    // MARK: - Views
    //==========================================================================
    
    lazy var menuStack: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.distribution = .FillEqually
        view.axis = .Vertical
        return view
    }()
   
    lazy var distributionButton: UIButton = {
        let button = UIButton()
        button.setTitle("Full Stack Distribution", forState: .Normal)
        button.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button.backgroundColor = UIColor.greenColor()
        button.addTarget(self, action: Selector("showDistribution"), forControlEvents: .TouchUpInside)
        return button
    }()
    
    lazy var alignmentButton: UIButton = {
        let button = UIButton()
        button.setTitle("When the Stacks Align", forState: .Normal)
        button.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button.backgroundColor = UIColor.blueColor()
        button.addTarget(self, action: Selector("showAlignment"), forControlEvents: .TouchUpInside)
        return button
    }()
    
    lazy var stackOverflowButton: UIButton = {
        let button = UIButton()
        button.setTitle("Stack Overflow!", forState: .Normal)
        button.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button.backgroundColor = UIColor.redColor()
        button.addTarget(self, action: Selector("showStackOverflow"), forControlEvents: .TouchUpInside)
        return button
    }()

    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }
}