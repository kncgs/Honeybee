//
//  PiePopoverViewController.swift
//  Honeybee
//
//  Created by Dongbing Hou on 08/04/2017.
//  Copyright © 2017 Dongbing Hou. All rights reserved.
//

import UIKit

class PiePopoverController: UITableViewController {
    
    var dataSource = [String]()
    
    var didSelectRow: ((Int) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        preferredContentSize = CGSize(width: 100, height: 120)
        tableView.tableFooterView = UIView()
        dataSource = [ "自定义", "上上月", "上月"]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: nil)
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        didSelectRow?(indexPath.row)
        dismiss(animated: true, completion: nil)
    }
}
