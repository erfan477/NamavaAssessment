//
//  View+Anchor.swift
//  BaseModule
//
//  Created by mmdMoovic on 5/7/22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit

// MARK: - UIView
public extension UIView {
    
    func anchorToTop(top : NSLayoutYAxisAnchor? = nil, left : NSLayoutXAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, bottom : NSLayoutYAxisAnchor? = nil) {
        anchorWithConstantsToTop(top: top, left: left, right: right, bottom: bottom, topConstant: 0, leftConstant: 0, rightConstant: 0, bottomConstant: 0)
    }
    
    func anchorWithConstantsToTop(top : NSLayoutYAxisAnchor? = nil, left : NSLayoutXAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil,
                                  bottom : NSLayoutYAxisAnchor? = nil , topConstant : CGFloat = 0 ,
                                  leftConstant : CGFloat = 0 , rightConstant : CGFloat = 0 , bottomConstant : CGFloat = 0)
    {
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            topAnchor.constraint(equalTo: top,constant: topConstant).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom,constant: bottomConstant).isActive = true
        }
        if let left = left {
            leftAnchor.constraint(equalTo: left,constant: leftConstant).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right,constant: -rightConstant).isActive = true
        }
        if let top = top {
            topAnchor.constraint(equalTo: top,constant: topConstant).isActive = true
        }
    }

    func adjustHeight(for height: CGFloat, screenHeight: CGFloat) -> CGFloat {
        return (height/screenHeight)*( UIScreen.main.bounds.height)
    }
    
    func adjustWidth(for width: CGFloat, screenWidth: CGFloat) -> CGFloat {
        return (width/screenWidth)*(UIScreen.main.bounds.width)
    }
}
