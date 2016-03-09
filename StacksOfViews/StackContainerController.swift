//
//  StackContainerController.swift
//  StacksOfViews
//
//  Created by Peter Buerer on 3/7/16.
//  Copyright © 2016 Peter Buerer. All rights reserved.
//

import UIKit

class StackContainerController: UIViewController {
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.whiteColor()
        view.addSubview(container)
        
        //gross but works
        let orientation = UIDevice.currentDevice().orientation
        if orientation == .LandscapeLeft || orientation == .LandscapeRight {
            container.axis = .Horizontal
        }
        else {
            container.axis = .Vertical
        }
        
        let views = ["container": container]
        NSLayoutConstraint.activateConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[container]-(8.0)-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views))
        NSLayoutConstraint.activateConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-(8.0)-[container]-(8.0)-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views))
        NSLayoutConstraint(item: container, attribute: .Top, relatedBy: .Equal, toItem: topLayoutGuide, attribute: .Bottom, multiplier: 1.0, constant: 8.0).active = true
    }
   
    override func willTransitionToTraitCollection(newCollection: UITraitCollection, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransitionToTraitCollection(newCollection, withTransitionCoordinator: coordinator)
        coordinator.animateAlongsideTransition({ [weak self] (context) -> Void in
            guard let strongSelf = self else { return }
           
            //this is just for convenience in this demo app and doesn't work to switch axis on rotation on all devices
            switch(strongSelf.container.axis) {
            case .Vertical:
                strongSelf.container.axis = .Horizontal
            case .Horizontal:
                strongSelf.container.axis = .Vertical
            }
        }, completion: nil)
    }
    
    //==========================================================================
    // MARK: - Views
    //==========================================================================

    lazy var container: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false;
        view.axis = .Vertical
        view.backgroundColor = UIColor.redColor()
        view.distribution = .FillProportionally
        return view
    }()
}

    