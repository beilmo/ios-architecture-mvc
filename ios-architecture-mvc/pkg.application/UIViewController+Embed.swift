//
//  UIViewController+Embed.swift
//  ios-architecture-mvc
//
//  Created by Dorin Danciu on 12/10/17.
//  Copyright © 2017 Beilmo. All rights reserved.
//

import UIKit

extension UIViewController {

    func embed(child: UIViewController, duration: TimeInterval = 0.0, completion: ((Bool) -> Void)? = nil) {
        let current = childViewControllers.last
        addChildViewController(child)

        let newView = child.view!
        newView.translatesAutoresizingMaskIntoConstraints = true
        newView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        newView.frame = view.bounds

        if let existing = current {
            existing.willMove(toParentViewController: nil)

            transition(from: existing, to: child, duration: duration, options: [.transitionCrossDissolve], animations: { }, completion: { done in
                existing.removeFromParentViewController()
                child.didMove(toParentViewController: self)
                completion?(done)
            })
        } else {
            view.addSubview(newView)

            UIView.animate(withDuration: duration, delay: 0, options: [.transitionCrossDissolve], animations: { }, completion: { done in
                child.didMove(toParentViewController: self)
                completion?(done)
            })
        }
    }

}
