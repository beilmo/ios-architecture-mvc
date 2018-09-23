//
//  PresentationTableViewCell.swift
//  ios-architecture-mvc
//
//  Created by Dorin Danciu on 09/09/2018.
//  Copyright © 2018 Beilmo. All rights reserved.
//

import Foundation
import UIKit

class PresentationTableViewCell: UITableViewCell {

    let headlineLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.preferredFont(forTextStyle: .title3)
        view.numberOfLines = 0

        return view
    }()

    let favoriteSwitch: UISwitch = {
        let view = UISwitch()
        view.setContentHuggingPriority(.required, for: .horizontal)
        view.setContentCompressionResistancePriority(.required, for: .horizontal)

        return view
    }()

    var downloadButton: UIButton {
        let view = UIButton(type: .roundedRect)
        view.setContentHuggingPriority(UILayoutPriority(100), for: .horizontal)
        view.setContentCompressionResistancePriority(.required, for: .horizontal)

        view.setTitle(" Download ", for: .normal)
        view.layer.cornerRadius = 15
        view.backgroundColor = view.tintColor
        view.setTitleColor(.white, for: .normal)

        return view
    }

    lazy var outlineView: OutlineView = {
        let view = OutlineView(headlineView: self.headlineLabel)
        view.prefixView = favoriteSwitch
//        view.suffixView = downloadButton
        view.spacing = 8
        view.alignment = .center
        view.distribution = .fillProportionally
        view.layoutMargins = UIEdgeInsets(top: 16, left: 8, bottom: 16, right: 8)
        view.isLayoutMarginsRelativeArrangement = true

        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        outlineView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(outlineView)

        outlineView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        outlineView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        outlineView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        outlineView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
