//
//  TopicListViewController.swift
//  ios-architecture-mvc
//
//  Created by Dorin Danciu on 12/10/17.
//  Copyright © 2017 Beilmo. All rights reserved.
//

import UIKit

class TopicListViewController: UITableViewController {

    private struct Constants {
        static let cellIdentifier = "TopicCellIdentifier"
    }

    weak var delegate: TopicListDelegate?

    override func viewDidLoad() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.cellIdentifier)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelect(item: itemAtPosition(indexPath: indexPath))
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath)
        return cell
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.textLabel?.text = String(describing: itemAtPosition(indexPath: indexPath))
    }

}


// MARK: - Public Methods

extension TopicListViewController {

    func itemAtPosition(indexPath: IndexPath) -> Any {
        return indexPath.description
    }

}
