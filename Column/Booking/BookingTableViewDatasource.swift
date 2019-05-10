//
//  BookingTableViewDatasource.swift
//  Column
//
//  Created by Stephen Wu on 5/10/19.
//  Copyright © 2019 Stephen Wu. All rights reserved.
//

import UIKit

class BookingTableViewDatasource: NSObject, UITableViewDataSource {

    var businesses: [Int] = []

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

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return businesses.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReuseId.cell, for: indexPath)
        return cell
    }
}

// MARK: Table view delegate

extension BookingTableViewDatasource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? BookingResultTableViewCell else { return }

        cell.expand()
        tableView.beginUpdates()
        tableView.endUpdates()
    }
}
