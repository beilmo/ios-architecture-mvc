//
//  TopicDetailsViewController.swift
//  ios-architecture-mvc
//
//  Created by Dorin Danciu on 12/10/17.
//  Copyright © 2017 Beilmo. All rights reserved.
//

import UIKit


/// The video
/// The title
/// The description
/// The contextual actions
/// The related content

class TopicDetailsViewController: UIViewController {

    let videoViewController: TopicVideoViewController
    let titleViewController: TopicTitleViewController
    let descriptionViewController: TopicDescriptionViewController
    let actionsViewController: TopicActionsViewController
    let relatedContentViewController: RelatedTopicsViewController

    var scrollView : UIScrollView!

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.videoViewController = TopicDetailsViewController.newVideoViewController()
        self.titleViewController = TopicDetailsViewController.newTitleViewController()
        self.descriptionViewController = TopicDetailsViewController.newDescriptionViewController()
        self.actionsViewController = TopicDetailsViewController.newActionsViewController()
        self.relatedContentViewController = TopicDetailsViewController.newRelatedTopicsViewController()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        self.scrollView = UIScrollView()
        view.addSubview(scrollView)

        // apply layout
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true

        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
//        stackView.alignment = .fill
//        stackView.spacing = 0

        stackView.addArrangedSubview(videoViewController.view)
        stackView.addArrangedSubview(titleViewController.view)
        stackView.addArrangedSubview(descriptionViewController.view)
        stackView.addArrangedSubview(actionsViewController.view)
        stackView.addArrangedSubview(relatedContentViewController.view)

        scrollView.addSubview(stackView)

        // apply layout
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }

    override func viewDidLoad() {
        scrollView.backgroundColor = .red
    }
}

// MARK: - Public Methods
extension TopicDetailsViewController {

    static func newVideoViewController() -> TopicVideoViewController {
        return TopicVideoViewController()
    }

    static func newTitleViewController() -> TopicTitleViewController {
        return TopicTitleViewController()
    }

    static func newDescriptionViewController() -> TopicDescriptionViewController {
        return TopicDescriptionViewController()
    }

    static func newActionsViewController() -> TopicActionsViewController {
        return TopicActionsViewController()
    }

    static func newRelatedTopicsViewController() -> RelatedTopicsViewController {
        return RelatedTopicsViewController()
    }
}

