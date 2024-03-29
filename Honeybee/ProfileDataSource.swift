//
//  ProfileDataSource.swift
//  Honeybee
//
//  Created by nvicky on 13/03/2017.
//  Copyright © 2017 Dongbing Hou. All rights reserved.
//

import UIKit

class ProfileDataSource: NSObject, DataSourceProvider {
    typealias ItemType = SetupItem
    var items: [ItemType]
    required init(items: [ItemType]) {
        self.items = items
    }
}

extension ProfileDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(SetupCell.self)")
        if let cell = cell as? SetupCell {
            cell.item = item(at: indexPath)
        }
        return cell!
    }
}
