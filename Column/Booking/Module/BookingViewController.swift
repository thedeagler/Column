//
//  BookingViewController.swift
//  Column
//
//  Created by Stephen Wu on 5/9/19.
//  Copyright © 2019 Stephen Wu. All rights reserved.
//

import UIKit

class BookingViewController: UIViewController {
    weak var interactor: BookingInteractor?

    @IBOutlet weak var headerContainer: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!

    /// Constraint from search bar top to the top of the safe area
    @IBOutlet weak var searchToContainerTop: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
}

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

extension BookingViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
        collapseHeader()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.setShowsCancelButton(false, animated: true)
        expandHeader()
    }
}
