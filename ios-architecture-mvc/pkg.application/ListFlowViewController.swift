//
//  ListFlowViewController.swift
//  ios-architecture-mvc
//
//  Created by Dorin Danciu on 12/10/17.
//  Copyright © 2017 Beilmo. All rights reserved.
//

import Foundation
import UIKit

class ListFlowViewController: UIViewController {

    private lazy var embededNavigationController: UINavigationController = {
        return UINavigationController()
    }()

    var listViewController: UIViewController? {
        didSet {
            var viewControllers = [UIViewController]()
            if let rootController = listViewController {
                viewControllers.append(rootController)
            }
            embededNavigationController.setViewControllers(viewControllers, animated: false)
        }
    }

    override func loadView() {
        super.loadView()
        embed(child: embededNavigationController)
    }
}


// MARK: - Public Methods

 extension ListFlowViewController {

    func present(detailsController: UIViewController) {
        embededNavigationController.pushViewController(detailsController, animated: true)
    }

}
