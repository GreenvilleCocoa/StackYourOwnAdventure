//
//  IntrinsicView.swift
//  StacksOfViews
//
//  Created by Peter Buerer on 3/7/16.
//  Copyright © 2016 Peter Buerer. All rights reserved.
//

import UIKit

class IntrinsicView: UIView {
  
    private var size: CGSize = CGSize.zero
    
    init(size: CGSize) {
        super.init(frame: CGRect(origin: CGPoint.zero, size: size))
        self.size = size
    }
    
    override func intrinsicContentSize() -> CGSize {
        return size
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }
}