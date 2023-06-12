//
//  Constants.swift
//  NamavaAssessment
//
//  Created by mmdMoovic on 6/12/23.
//

import UIKit

struct K {
    // MARK: - sizes
    struct sizes {
        // screen width
        static let mainWidth = UIScreen.main.bounds.width
        // screen height
        static let mainHeight = UIScreen.main.bounds.height
        
        // screen ratio
        static var ratio : Double{
            return Double((mainHeight/mainWidth))
        }
        
        // default paddings
        static var rightPadding: CGFloat = 24
        static var leftPadding: CGFloat = 24
        
        // Screen width - paddings
        static var width : CGFloat {
            return UIScreen.main.bounds.width - CGFloat((rightPadding+leftPadding))
        }
    }
    

}
