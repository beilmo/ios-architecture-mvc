//
//  TopicListFlowViewController.swift
//  ios-architecture-mvc
//
//  Created by Dorin Danciu on 12/10/17.
//  Copyright © 2017 Beilmo. All rights reserved.
//

import Foundation

class TopicListFlowViewController: ListFlowViewController {

    override func loadView() {
        super.loadView()
        embed(listViewController: newListViewController())
    }

}

// MARK: - Private Methods

private extension TopicListFlowViewController {

    func newListViewController() -> TopicListViewController {
        let newViewController = TopicListViewController()
        return newViewController
    }

    func newDetailFlowViewController() -> TopicDetailsFlowViewController {
        let newViewController = TopicDetailsFlowViewController()
        return newViewController
    }

    func embed(listViewController: TopicListViewController) {
        // 1. Set ourself as list delegate
        listViewController.delegate = self

        // 2. Set flow's list controller
        self.listViewController = listViewController
    }

}


// MARK: - TopicListDelegate

extension TopicListFlowViewController: TopicListDelegate {

    func didSelect(item: Any) {
        let detailsView = newDetailFlowViewController()
        detailsView.title = String(describing: item)
        present(detailsController: detailsView)
    }

}
