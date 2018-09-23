//
//  OutlineView.swift
//  ios-architecture-mvc
//
//  Created by Dorin Danciu on 09/09/2018.
//  Copyright © 2018 Beilmo. All rights reserved.
//

import Foundation
import UIKit

class OutlineView: UIStackView {

    var headlineView: UIView

    var prefixView: UIView? {
        didSet {
            if let view = prefixView {
                insertArrangedSubview(view, at: 0)
            } else if let view = oldValue {
                removeArrangedSubview(view)
            }
        }
    }

    var suffixView: UIView? {
        didSet {
            if let view = suffixView {
                let index = prefixView == nil ? 1 : 2
                insertArrangedSubview(view, at: index)
            } else if let view = oldValue {
                removeArrangedSubview(view)
            }
        }
    }

    init(headlineView: UIView) {
        self.headlineView = headlineView
        super.init(frame: CGRect.zero)
        addArrangedSubview(headlineView)
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
