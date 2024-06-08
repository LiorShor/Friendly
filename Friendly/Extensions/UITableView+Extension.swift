//
//  UITableView+Extension.swift
//  Friendly
//
//  Created by Lior Shor on 27/05/2023.
//

import UIKit

extension UITableView {
    func animateWithFade(duration: TimeInterval = Constants.AnimationDuration.loader, completion: (() -> Void)? = nil) {
        UIView.transition(
            with: self,
            duration: duration,
            options: .transitionCrossDissolve,
            animations: { self.reloadData() }) { _ in completion?() }
    }
}
