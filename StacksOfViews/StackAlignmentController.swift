//
//  StackAlignmentController.swift
//  StacksOfViews
//
//  Created by Peter Buerer on 3/7/16.
//  Copyright © 2016 Peter Buerer. All rights reserved.
//

import UIKit

class StackAlignmentController: StackContainerController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        container.distribution = .EqualSpacing
        container.alignment = .Center
        
        container.addArrangedSubview(one)
        container.addArrangedSubview(two)
        container.addArrangedSubview(three)
       
        buttonStack.addArrangedSubview(fillButton)
        buttonStack.addArrangedSubview(leadingButton)
        buttonStack.addArrangedSubview(centerButton)
        buttonStack.addArrangedSubview(trailingButton)
        container.addArrangedSubview(buttonStack)
    }
   
    //==========================================================================
    // MARK: - Actions
    //==========================================================================
    
    func setAlignmentFill() {
       UIView.animateWithDuration(0.3) { [weak self] () -> Void in
            guard let strongSelf = self else { return }
            strongSelf.container.alignment = .Fill
        }
    }
    
    func setAlignmentLeading() {
        UIView.animateWithDuration(0.3) { [weak self] () -> Void in
            guard let strongSelf = self else { return }
            strongSelf.container.alignment = .Leading
        }
    }
    
    func setAlignmentCenter() {
        UIView.animateWithDuration(0.3) { [weak self] () -> Void in
            guard let strongSelf = self else { return }
            strongSelf.container.alignment = .Center
        }
    }
    
    func setAlignmentTrailing() {
        UIView.animateWithDuration(0.3) { [weak self] () -> Void in
            guard let strongSelf = self else { return }
            strongSelf.container.alignment = .Trailing
        }
    }


    //==========================================================================
    // MARK: - Views
    //==========================================================================
   
    lazy var one: UIImageView = {
        let view = UIImageView(image: UIImage(named: "sword.png"))
        return view
    }()
    
    lazy var two: UIImageView = {
        let view = UIImageView(image: UIImage(named: "mejais.png"))
        return view
    }()
    
    lazy var three: UIImageView = {
        let view = UIImageView(image: UIImage(named: "rod.png"))
        return view
    }()
    
    lazy var fillButton: UIButton = {
        let button = UIButton()
        button.setTitle("Fill", forState: .Normal)
        button.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button.addTarget(self, action: Selector("setAlignmentFill"), forControlEvents: .TouchUpInside)
        return button
    }()
    
    lazy var leadingButton: UIButton = {
        let button = UIButton()
        button.setTitle("Leading", forState: .Normal)
        button.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button.addTarget(self, action: Selector("setAlignmentLeading"), forControlEvents: .TouchUpInside)
        return button
    }()
    
    lazy var centerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Center", forState: .Normal)
        button.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button.addTarget(self, action: Selector("setAlignmentCenter"), forControlEvents: .TouchUpInside)
        return button
    }()
    
    lazy var trailingButton: UIButton = {
        let button = UIButton()
        button.setTitle("Trailing", forState: .Normal)
        button.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button.addTarget(self, action: Selector("setAlignmentTrailing"), forControlEvents: .TouchUpInside)
        return button
    }()
    
    lazy var buttonStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .Vertical
        stack.distribution = .FillEqually
        return stack
    }()
}
