//
//  BookingTableViewDatasource.swift
//  Column
//
//  Created by Stephen Wu on 5/10/19.
//  Copyright © 2019 Stephen Wu. All rights reserved.
//

import UIKit

class BookingTableViewDatasource: NSObject, UITableViewDataSource {

    var places: [BookingResultViewModel] = []
    weak var cellActionDelegate: BookingResultCellDelegate?

    struct ReuseId {
        static let cell = "cell"
    }

    /// Sets the datasource as the given table view's datasource
    func set(for tableView: UITableView) {
        tableView.register(BookingResultTableViewCell.nib(), forCellReuseIdentifier: ReuseId.cell)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }

    /// Attempts to disable the call button for the place with the given id.
    ///
    /// - Parameter placeId: the identifier for the place to disable calling
    /// - Returns: the index path of the place if disabled successfully
    func disableCalling(for placeId: String) -> IndexPath? {
        guard let i = places.firstIndex(where: { $0.id == placeId }) else { return nil }
        places[i] = places[i].invalidatingPhoneNumber()
        return places[i].hasValidPhoneNumber ? nil : IndexPath(row: i, section: 0)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ReuseId.cell, for: indexPath) as? BookingResultTableViewCell else {
            fatalError("Dequeued cell of incorrect type.")
        }

        cell.configure(for: places[indexPath.row])
        cell.delegate = cellActionDelegate
        return cell
    }
}

// MARK: Table view delegate

extension BookingTableViewDatasource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? BookingResultTableViewCell else { return }

        places[indexPath.row].isExpanded ? cell.collapse() : cell.expand()
        places[indexPath.row] = places[indexPath.row].togglingSize()

        tableView.beginUpdates()
        tableView.endUpdates()
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
