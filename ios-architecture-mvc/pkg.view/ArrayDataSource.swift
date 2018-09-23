//
//  ArrayDataSource.swift
//  ios-architecture-mvc
//
//  Created by Dorin Danciu on 08/09/2018.
//  Copyright © 2018 Beilmo. All rights reserved.
//

import Foundation
import UIKit

public class ArrayDataSource<Element>: NSObject, UITableViewDataSource {

    public var contents: [Element] {
        didSet {
            dump(contents)
        }
    }
    public var identifier: (Element) -> String
    public var configure: (Element, UITableViewCell) -> ()
    public var remove: ((_ at: Int) -> ())? = nil
    public var insert: ((_ at: Int) -> ())? = nil

    init(_ contents: [Element],
         identifier: @escaping (Element) -> String,
         configure: @escaping (Element, UITableViewCell) -> ())
    {
        self.contents = contents
        self.identifier = identifier
        self.configure = configure
    }

    public func tableView(_ tableView: UITableView,
                          numberOfRowsInSection section: Int) -> Int
    {
        return contents.count
    }

    public func tableView(_ tableView: UITableView,
                          cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let element = contents[indexPath.row]
        let cellIdentifier = identifier(element)
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,
                                                 for: indexPath)
        configure(element, cell)

        return cell
    }

    public func tableView(_ tableView: UITableView,
                          canEditRowAt indexPath: IndexPath) -> Bool
    {
        return remove != nil || insert != nil
    }

    public func tableView(_ tableView: UITableView,
                          commit editingStyle: UITableViewCell.EditingStyle,
                          forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            remove?(indexPath.row)
        case .insert:
            insert?(indexPath.row)
        default:
            break
        }
    }
}
