//
//  BarViewController.swift
//  Honeybee
//
//  Created by Dongbing Hou on 22/02/2017.
//  Copyright © 2017 Dongbing Hou. All rights reserved.
//

import UIKit
import DZNEmptyDataSet


protocol TableViewProvider {
    var delegate: UITableViewDelegate! { set get }
    var dataSource: UITableViewDataSource! { set get }
    var tableView: UITableView { get }
}
extension TableViewProvider {
    var tableView: UITableView {
        let tv = UITableView()
        tv.delegate = delegate
        tv.dataSource = dataSource
        tv.separatorStyle = .none
        tv.showsVerticalScrollIndicator = false
        tv.showsHorizontalScrollIndicator = false
        return tv
    }
}


class BarViewController: BaseTableViewController {

    var dataSource: BarDataSource!
    
    
    init(recorders: [RLMRecorder]) {
        super.init(nibName: nil, bundle: nil)
        dataSource = BarDataSource(items: recorders)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var header: BarHeader!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.register(BarCell.self)
        
        
        tableView.emptyDataSetSource = self
        
//        header = BarHeader(height: 170)
//        tableView.tableHeaderView = header//BarHeader(height: 170)
        
//        setNavRightItem("筛选")
        fetchData()
    }
    
//    override func navRightItemClicked(_ btn: UIButton) {
//        let destVC = BarPopoverController()
//        destVC.modalPresentationStyle = .popover
//        let popoverVC = destVC.popoverPresentationController!
//        popoverVC.backgroundColor = .white
//        popoverVC.delegate = self
//        popoverVC.sourceView = btn
//        popoverVC.sourceRect = btn.bounds
//        popoverVC.permittedArrowDirections = .up
//        destVC.didSelectRow = {row in
//            print("----\(row)")
//        }
//        present(destVC, animated: true, completion: nil)
//    }
    
    func fetchData() {
        tableView.dataSource = dataSource
        dataSource.fetch { (data) in
            
            header = BarHeader(height: 200, data: data)
            tableView.tableHeaderView = header
            
        }
    }
}


extension BarViewController: DZNEmptyDataSetSource {
    func image(forEmptyDataSet scrollView: UIScrollView!) -> UIImage! {
        return UIImage(named: "xmark")
    }
}


// MARK: UIPopoverPresentationControllerDelegate
extension BarViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}

// MARK: UITableViewDelegate
extension BarViewController {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = RecordDetailController(model: dataSource.item(at: indexPath))
        navigationController?.pushViewController(vc, animated: true)
    }
}


extension BarViewController {
//    override var shouldAutorotate: Bool {
//        return true
//    }
//    
//    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
//        return .landscapeLeft
//    }
//    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
//        return .all
//    }
//    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//        super.viewWillTransition(to: size, with: coordinator)
//        
////        let isLand = coordinator.containerView.bounds.width > coordinator.containerView.bounds.height
////        coordinator.animate(alongsideTransition: { (context) in
////            self.header = BarHeader(height: 370)
////        }) { (context) in
////            
////        }
//        header.snp.updateConstraints { (make) in
//            make.top.left.right.equalTo(view)
//            make.height.equalTo(300)
//            
//            
//        }
//        
//    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(deviceOrientationDidChange), name: .UIDeviceOrientationDidChange, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self)
    }
    
    func deviceOrientationDidChange(_ noti: Notification) {
//        header.barView.snp.removeConstraints()
//        header.barView.snp.updateConstraints { (make) in
//            make.left.equalTo(view).offset(20)
//            make.right.equalTo(view).offset(-20).priority(HB.Priority.mid)
//            make.bottom.equalTo(view).offset(-20)
//            make.top.equalTo(view).offset(44)
////            make.bottom.equalTo(view.snp.bottom)
////                        make.height.equalTo(view.snp.width).multipliedBy(UIScreen.main.bounds.width/UIScreen.main.bounds.height)
//
//        }
//        let orientation = UIDevice.current.orientation
//        print(orientation)
//        let vc = TTestViewController()
//        
//        if orientation.isLandscape {
//            present(vc, animated: false, completion: nil)
//        } else {
////            vc.dismiss(animated: false, completion: nil)
//        }
    }
    
}
