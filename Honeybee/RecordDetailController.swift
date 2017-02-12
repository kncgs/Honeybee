//
//  RecordDetailController.swift
//  Honeybee
//
//  Created by Dongbing Hou on 11/02/2017.
//  Copyright © 2017 Dongbing Hou. All rights reserved.
//

import UIKit

class RecordDetailController: UIViewController {
    
    
    
    lazy var tableView = UITableView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        navigationController?.navigationBar.shadowImage = UIImage() //只有设为default黑线才能去除
        // 设置导航栏返回按钮，返回文字颜色
        navigationController?.navigationBar.tintColor = HonybeeColor.main
        
        // 设置 UIBarButtonItem 字体颜色
//        UIBarButtonItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.green], for: UIControlState.normal)
        
        // 隐藏返回按钮文字
        let buttonItem = UIBarButtonItem.appearance(whenContainedInInstancesOf: [UINavigationBar.self])
        buttonItem.setBackButtonTitlePositionAdjustment(UIOffset(horizontal: -100, vertical: -100), for: .default)
        
        automaticallyAdjustsScrollViewInsets = false // 默认 true (0, 0)点从导航栏下开始， false： (0, 0)就是屏幕左上角
        
        setupNavTitle()
        
        addTableView()
    }
    
    func setupNavTitle() {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 44))
        titleLabel.text = "详情"
        titleLabel.textAlignment = .center
        titleLabel.font = HonybeeFont.subTitleFont
        titleLabel.textColor = HonybeeColor.main
        navigationItem.titleView = titleLabel
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func addTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        
//        tableView.estimatedRowHeight = 60
//        tableView.rowHeight = UITableViewAutomaticDimension
        
        tableView.rowHeight = 60
        
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        
        
        tableView.register(RecordDetailCell.self, forCellReuseIdentifier: "RecordDetailCell")
        tableView.register(RecordNumberCell.self, forCellReuseIdentifier: "RecordNumberCell")
        tableView.register(RecordDateCell.self, forCellReuseIdentifier: "RecordDateCell")
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(view).offset(64) // 导航栏本是透明的，假装导航栏是白色
            make.left.right.bottom.equalTo(view)
//            make.edges.equalTo(view)
        }
        let header = RecordDetailHeader(height: 115, title: "吃饭", imageName: "meal")
        tableView.tableHeaderView = header // 这样设置的 header 宽度一定是tableview 的宽度
        
    }
}



extension RecordDetailController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "RecordNumberCell") as? RecordDetailCell
        if cell!.isKind(of: RecordNumberCell.self) {
            cell = RecordDetailCell(style: .default, reuseIdentifier: "RecordNumberCell")
        } else if cell!.isKind(of: RecordDateCell.self) {
            cell = RecordDetailCell(style: .default, reuseIdentifier: "RecordDateCell")
        }
        return cell!
    }
    
}