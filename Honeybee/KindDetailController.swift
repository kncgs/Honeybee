//
//  KindDetailController.swift
//  Honeybee
//
//  Created by Dongbing Hou on 08/03/2017.
//  Copyright © 2017 Dongbing Hou. All rights reserved.
//

import UIKit

class KindDetailController: BaseCollectionViewController {
    
  
    var dataSource: ArrayDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false
        setNavTitle("衣")
        addHeader()
        addTipView()
        addCollectionView()
        fetchData()
        
    }
    
    func fetchData() {
        let items = HBKindManager.manager.allKinds()[0].items!
        dataSource = ArrayDataSource(identifier: "\(KindDetailCell.self)", items: items) { (cell, model) in
            if let cell = cell as? KindDetailCell, let model = model as? HoneybeeItem {
                cell.configWith(model: model)
            }
        }
        collectionView.dataSource = dataSource
    }
}

extension KindDetailController {
    
    func addCollectionView() {
        layout.itemSize = CGSize(width: 65, height: 65)
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 50, right: 0)
        collectionView.snp.updateConstraints { (make) in
            make.top.equalTo(115+64)
            make.right.equalTo(view).offset(-60)
        }
        collectionView.register(KindDetailCell.self)
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(longGestureAction(_:)))
        collectionView.addGestureRecognizer(longGesture)
        
    }
    //    func allCells<T: UICollectionViewCell>(_: T.Type) -> [T] {
    //        if collectionView.visibleCells.count >= dataSource.count {
    //            return collectionView.visibleCells as! [T]
    //        }
    //        var cells = [UICollectionViewCell]()
    //        for i in 0..<dataSource.count {
    //            let idx = IndexPath(item: i, section: 0)
    //            let cell = collectionView.cellForItem(at: idx)
    //            cells.append(cell!)
    //        }
    //        return cells as! [T]
    //    }
    
    func longGestureAction(_ gesture: UILongPressGestureRecognizer) {
        switch gesture.state {
        case .began:
            guard let selectedIdx = collectionView.indexPathForItem(at: gesture.location(in: collectionView)) else {
                break
            }
            let cell = collectionView.cellForItem(at: selectedIdx) as! KindDetailCell
            cell.deleteBtn.isHidden = false
            
            //            let cells = allCells(KindDetailCell.self)
            //            for cell in cells {
            //                cell.deleteBtn.isHidden = false
            //            }
            
            
            //            dataSource.remove(at: selectedIdx.item)
            //            collectionView.deleteItems(at: [selectedIdx])
            //        case .changed:
        //            collectionView.updateInteractiveMovementTargetPosition(gesture.location(in: gesture.view))
        case .ended:
            collectionView.endInteractiveMovement()
        default:
            collectionView.cancelInteractiveMovement()
        }
    }
    
    func addHeader() {
        let header = KindDetailHeader(frame: CGRect(x: 0, y: 64, width: HB.Screen.w, height: 115))
        view.addSubview(header)
    }
    
    func addTipView() {
        let label = UILabel(frame: CGRect(x: HB.Screen.w - 50 - 40, y: 230, width: 130, height: 50))
        label.text = "长 按 可 删 除"
        label.font = HB.Font.h5_light
        label.textColor = UIColor.gray
        let t1 = CGAffineTransform(scaleX: -1, y: 1)//.rotated(by: -(CGFloat)(M_PI_2))
        let t2 = CGAffineTransform(rotationAngle: -90 * CGFloat.pi/180)
        label.transform = t1.concatenating(t2)
        view.addSubview(label)
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension KindDetailController {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("-------\(indexPath.section)----\(indexPath.row)")
    }
}