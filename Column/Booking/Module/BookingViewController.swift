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
    /// Used to place phone calls
    private let urlOpener: URLOpener

    @IBOutlet weak var headerContainer: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var resultsTableView: UITableView!
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var instructionOverlay: UIView!

    /// Constraint from search bar top to the top of the safe area
    @IBOutlet weak var searchToContainerTop: NSLayoutConstraint!

    init(interactor: BookingInteractor,
         urlOpener: URLOpener = UIApplication.shared) {
        self.interactor = interactor
        self.urlOpener = urlOpener
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        showInstructionOverlay()
    }

    func showInstructionOverlay() {
        instructionOverlay.isHidden = false
    }

    func hideInstructionOverlay() {
        instructionOverlay.isHidden = true
    }

    func show(places: [BookingResultViewModel]) {
        datasource = BookingTableViewDatasource()
        datasource?.places = places
        datasource?.set(for: resultsTableView)
        datasource?.cellActionDelegate = self
        hideInstructionOverlay()
        hideLoading()
    }

    func call(url: URL) {
        if urlOpener.canOpenURL(url) {
            urlOpener.open(url, options: [:], completionHandler: nil)
        }
    }

    func show(alert: UIAlertController) {
        hideLoading()
        present(alert, animated: true, completion: nil)
    }

    func disableCalling(for placeId: String) {
        guard let indexPath = datasource?.disableCalling(for: placeId) else { return }
        resultsTableView.beginUpdates()
        resultsTableView.reloadRows(at: [indexPath], with: .fade)
        resultsTableView.endUpdates()
    }

    func showLoading() {
        loadingView.isHidden = false
    }

    func hideLoading() {
        loadingView.isHidden = true
    }

    /// Resets the header to the initial state, i.e. expanded, not first responder, no text, etc
    func resetHeader() {
        expandHeader()
        searchBar.text = nil
        searchBar.resignFirstResponder()
        searchBar.setShowsCancelButton(false, animated: true)
    }

    /// Resets the entire view back to its initial state
    func resetView() {
        resetHeader()
        hideLoading()
        show(places: [])
        showInstructionOverlay()
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
        searchBar.resignFirstResponder()
        searchBar.setShowsCancelButton(false, animated: true)
        hideInstructionOverlay()
        showLoading()
    }

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
        collapseHeader()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        resetView()
    }
}

// MARK: Cell action delegate
extension BookingViewController: BookingResultCellDelegate {
    func didTapCall(id: String) {
        interactor.getPhoneNumber(placeId: id)
    }
}
