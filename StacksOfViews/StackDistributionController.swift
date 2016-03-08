//
//  StackDistributionController.swift
//  StacksOfViews
//
//  Created by Peter Buerer on 3/7/16.
//  Copyright © 2016 Peter Buerer. All rights reserved.
//

import UIKit

class StackDistributionController: StackContainerController {
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        container.alignment = .Center
        container.spacing = 8.0
        container.distribution = .Fill
        
        container.addArrangedSubview(one)
        container.addArrangedSubview(two)
        container.addArrangedSubview(three)
        container.addArrangedSubview(four)
        
        buttonStack.addArrangedSubview(fillButton)
        buttonStack.addArrangedSubview(fillEquallyButton)
        buttonStack.addArrangedSubview(fillProportionallyButton)
        buttonStack.addArrangedSubview(equalSpacingButton)
        buttonStack.addArrangedSubview(equalCenteringButton)
        
        container.addArrangedSubview(buttonStack)
    }
    
    //==========================================================================
    // MARK: - Actions
    //==========================================================================
    
    func setDistributionFill() {
        UIView.animateWithDuration(0.3) { [weak self] () -> Void in
            guard let strongSelf = self else { return }
            strongSelf.container.distribution = .Fill
        }
    }
    
    func setDistributionFillEqually() {
        UIView.animateWithDuration(0.3) { [weak self] () -> Void in
            guard let strongSelf = self else { return }
            strongSelf.container.distribution = .FillEqually
        }
    }
    
    func setDistributionFillProportionally() {
        UIView.animateWithDuration(0.3) { [weak self] () -> Void in
            guard let strongSelf = self else { return }
            strongSelf.container.distribution = .FillProportionally
        }
    }
    
    func setDistributionEqualSpacing() {
        UIView.animateWithDuration(0.3) { [weak self] () -> Void in
            guard let strongSelf = self else { return }
            strongSelf.container.distribution = .EqualSpacing
        }
    }
    
    func setDistributionEqualCentering() {
        UIView.animateWithDuration(0.3) { [weak self] () -> Void in
            guard let strongSelf = self else { return }
            strongSelf.container.distribution = .EqualCentering
        }
    }   
    
    //==========================================================================
    // MARK: - Views
    //==========================================================================
    
 
    lazy var one: IntrinsicView = {
        let view = IntrinsicView(size: CGSize(width: 128, height: 32))
        view.backgroundColor = UIColor.blueColor()
        return view
    }()
    
    lazy var two: IntrinsicView = {
        let view = IntrinsicView(size: CGSize(width: 32, height: 128))
        view.backgroundColor = UIColor.purpleColor()
        return view
    }()
    
    lazy var three: IntrinsicView = {
        let view = IntrinsicView(size: CGSize(width: 64, height: 64))
        view.backgroundColor = UIColor.yellowColor()
        return view
    }()
   
    lazy var four: IntrinsicView = {
        let view = IntrinsicView(size: CGSize(width: 128, height: 64))
        view.backgroundColor = UIColor.orangeColor()
        return view
    }()
    
    lazy var fillButton: UIButton = {
        let button = UIButton()
        button.setTitle("Fill", forState: .Normal)
        button.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button.addTarget(self, action: Selector("setDistributionFill"), forControlEvents: .TouchUpInside)
        return button
    }()
    
    lazy var fillEquallyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Fill Equal", forState: .Normal)
        button.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button.addTarget(self, action: Selector("setDistributionFillEqually"), forControlEvents: .TouchUpInside)
        return button
    }()
    
    lazy var fillProportionallyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Fill Proportional", forState: .Normal)
        button.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button.addTarget(self, action: Selector("setDistributionFillProportionally"), forControlEvents: .TouchUpInside)
        return button
    }()
    
    lazy var equalSpacingButton: UIButton = {
        let button = UIButton()
        button.setTitle("Equal Spacing", forState: .Normal)
        button.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button.addTarget(self, action: Selector("setDistributionEqualSpacing"), forControlEvents: .TouchUpInside)
        return button
    }()
   
    lazy var equalCenteringButton: UIButton = {
        let button = UIButton()
        button.setTitle("Equal Centering", forState: .Normal)
        button.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button.addTarget(self, action: Selector("setDistributionEqualCentering"), forControlEvents: .TouchUpInside)
        return button
    }()
       
    lazy var buttonStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .Vertical
        stack.distribution = .FillEqually
        return stack
    }()
   
}