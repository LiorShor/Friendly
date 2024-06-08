//
//  UIView+Extension.swift
//  Friendly
//
//  Created by Lior Shor on 25/05/2023.
//

import UIKit

extension UIView {
    
    @IBInspectable internal var cornerRadius: CGFloat {
        get { return self.layer.cornerRadius }
        set { self.layer.cornerRadius = newValue }
    }
    
    @IBInspectable internal var borderWidth: CGFloat {
        get { return self.layer.borderWidth }
        set { self.layer.borderWidth = newValue }
    }
    
    @IBInspectable internal var borderColor: UIColor {
        get { return UIColor(cgColor: self.layer.borderColor ?? UIColor.clear.cgColor) }
        set { self.layer.borderColor = newValue.cgColor }
    }
    
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.4
        animation.values = [-15.0, 15.0, -15.0, 15.0, -7.5, 7.5, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
    
}
