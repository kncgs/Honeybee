//
//  RecordDetailController.swift
//  Honeybee
//
//  Created by Dongbing Hou on 11/02/2017.
//  Copyright © 2017 Dongbing Hou. All rights reserved.
//

import UIKit

class RecordDetailController: BaseViewController {
    
    
    lazy var tableView = UITableView()
    var model: Recorder!
    let cellTitles = ["金额", "记录时间", "分类", "备注"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav(title: "详情")
        addTableView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func addTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        
        tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableViewAutomaticDimension
//        tableView.rowHeight = 60
        
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        let header = RecordDetailHeader(height: 115, title: "吃饭", imageName: "meal")
        tableView.tableHeaderView = header // 这样设置的 header 宽度一定是tableview 的宽度
        tableView.tableFooterView = RecordDetailFooter(height: 50)
        
        tableView.register(RecordDetailCell.self, forCellReuseIdentifier: "\(RecordDetailCell.self)")
    }
}


// MARK: UITableViewDataSource
extension RecordDetailController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(RecordDetailCell.self)") as! RecordDetailCell
        cell.mainTitleLabel.text = cellTitles[indexPath.row]
        cell.setSubTitleAttributes(indexPath: indexPath, model: model)
        return cell
    }
    
}
