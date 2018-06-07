//
//  RoundedCorners.swift
//  kiDoku
//
//  Created by Rodrigo Sagebin on 6/7/18.
//  Copyright © 2018 Rodrigo Sagebin. All rights reserved.
//

import UIKit

protocol RoundedCorners {}
extension RoundedCorners where Self: Button {
    
    func roundCornersAndDropShadow(cornerRadius: CGFloat, shadowColor: CGColor,
                                   shadowOpacity: Float, shadowOffset: CGSize, shadowRadius: CGFloat) -> Void {
        
        layer.cornerRadius = cornerRadius//30
        layer.shadowColor = shadowColor//UIColor.black.cgColor
        layer.shadowOpacity = shadowOpacity//0.7
        layer.shadowOffset = shadowOffset //.zero
        layer.shadowRadius = shadowRadius //100
    }
}
