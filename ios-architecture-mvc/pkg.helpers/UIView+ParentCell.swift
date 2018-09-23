//
//  UIView+ParentCell.swift
//  ios-architecture-mvc
//
//  Created by Dorin Danciu on 12/09/2018.
//  Copyright © 2018 Beilmo. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    var parentCell: UITableViewCell? {
        get {
            if let view = self as? UITableViewCell {
                return view
            } else {
                return superview?.parentCell
            }
        }
    }
}
