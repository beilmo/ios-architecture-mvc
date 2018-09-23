//
//  TopicListViewController.swift
//  ios-architecture-mvc
//
//  Created by Dorin Danciu on 12/10/17.
//  Copyright © 2017 Beilmo. All rights reserved.
//

import UIKit

fileprivate extension String {
    static let cellIdentifier = "TopicCellIdentifier"
}

class TopicListViewController: UITableViewController {

    var store: Store!
    weak var delegate: TopicListDelegate?

    var dataSource: ArrayDataSource<Presentation>! {
        didSet {
            tableView.dataSource = dataSource
        }
    }

    override func viewDidLoad() {
        tableView.register(PresentationTableViewCell.self, forCellReuseIdentifier: .cellIdentifier)

        RandomSession.shared.load(store.presentationList()) { (result) in
            switch result.map(self.bindDownloadedContent) {
            case let .success(value):
                self.dataSource = self.makeDataSource(value)
            case let .failure(error):
                dump(error)
                break
            }
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelect(item: itemAtPosition(indexPath: indexPath))
    }
}


// MARK: - Public Methods

extension TopicListViewController {

    func itemAtPosition(indexPath: IndexPath) -> Any {
        return indexPath.description
    }

}

extension TopicListViewController {
    func makeDataSource(_ contents: [Presentation]) -> ArrayDataSource<Presentation> {
        return ArrayDataSource(contents,
                               identifier: { _ in .cellIdentifier },
                               configure: configurePresentationCell)
    }

    func bindDownloadedContent(to presentationList: [Presentation]) -> [Presentation] {
        return presentationList.map(bindDownloadedContent)
    }

    func bindDownloadedContent(to presentation: Presentation) -> Presentation {
        let contentList: [String: Presentation.Content] = [:]

        var updatedPresentation = presentation
        updatedPresentation.content = contentList[presentation.id]
        return updatedPresentation
    }

    @objc func toggleFavorite(_ sender: UISlider) {
        guard
            let cell = sender.parentCell as? PresentationTableViewCell,
            let indexPath = tableView.indexPath(for: cell) else {
            fatalError()
        }

        var presentation = dataSource.contents[indexPath.row]
        presentation.isFavorite.toggle()

//        RandomSession.shared.load(store.change(presentation)) { result in
//            switch result {
//            case let .failure(error):
//                dump(error)
//            }
//        }

        dataSource.contents[indexPath.row].isFavorite.toggle()
    }

    @objc func downloadContent(_ sender: UIButton) {
        guard
            let cell = sender.parentCell as? PresentationTableViewCell,
            let indexPath = tableView.indexPath(for: cell) else {
                fatalError()
        }

    }

    var configurePresentationCell: (Presentation, UITableViewCell) -> Void {
        return { element, cell in
            guard let cell = cell as? PresentationTableViewCell else {
                return
            }

            cell.headlineLabel.text = element.title
            cell.favoriteSwitch.isOn = element.isFavorite
            cell.downloadButton.isHidden = true

            cell.favoriteSwitch.addTarget(self, action: #selector(self.toggleFavorite(_:)), for: .valueChanged)
            cell.downloadButton.addTarget(self, action: #selector(self.downloadContent(_:)), for: .touchUpInside)
        }
    }
}
