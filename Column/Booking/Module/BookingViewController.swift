//
//  BookingViewController.swift
//  Column
//
//  Created by Stephen Wu on 5/9/19.
//  Copyright © 2019 Stephen Wu. All rights reserved.
//

import UIKit

class BookingViewController: UIViewController {
    private let interactor: BookingInteractor
    private var datasource: BookingTableViewDatasource?

    @IBOutlet weak var headerContainer: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var resultsTableView: UITableView!

    /// Constraint from search bar top to the top of the safe area
    @IBOutlet weak var searchToContainerTop: NSLayoutConstraint!

    init(interactor: BookingInteractor) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        interactor.findPlaces(for: "hilton")
    }

    func show(places: [BookingResultViewModel]) {
        datasource = BookingTableViewDatasource()
        datasource?.places = places
        datasource?.set(for: resultsTableView)
        datasource?.cellActionDelegate = self
    }
}

// MARK: Fileprivates

fileprivate extension BookingViewController {
    /// Expand the header to display the title and search bar
    func expandHeader() {
        searchToContainerTop.constant = .greatestFiniteMagnitude
        UIView.animate(withDuration: 0.25) {
            self.view.layoutIfNeeded()
            self.titleLabel.alpha = 1
        }
    }

    /// Collapse the header so that only the search bar shows
    func collapseHeader() {
        searchToContainerTop.constant = 0
        UIView.animate(withDuration: 0.25) {
            self.view.layoutIfNeeded()
            self.titleLabel.alpha = 0
        }
    }
}

// MARK: Search bar delegate

extension BookingViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let query = searchBar.text ?? ""
        interactor.findPlaces(for: query)
    }

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
        collapseHeader()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.setShowsCancelButton(false, animated: true)
        show(places: [])
        searchBar.text = nil
        expandHeader()
    }
}

// MARK: Cell action delegate
extension BookingViewController: BookingResultCellDelegate {
    func didTapCall(id: String) {
        interactor.getPhoneNumber(placeId: id)
    }
}
