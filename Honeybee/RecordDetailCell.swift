//
//  RecordDetailCell.swift
//  Honeybee
//
//  Created by Dongbing Hou on 11/02/2017.
//  Copyright © 2017 Dongbing Hou. All rights reserved.
//

import UIKit

enum ReocderDetallCellType: String {
    case number = "RecordNumberCell"
    case date = "RecordDateCell"
    case category = "RecordCategoryCell"
    case describle = "RecordDescirbleCell"
}

class RecordDetailCell: UITableViewCell {
    
    convenience init(type: ReocderDetallCellType) {
        
        
        switch type {
        case .number:
            let _ = RecordNumberCell(style: .default, reuseIdentifier: type.rawValue)
        default:
            break
        }
        
        self.init(style: .default, reuseIdentifier: type.rawValue)
    }
    
    
    lazy var mainTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = HonybeeFont.recordDetailMainTitle
        label.text = "记录时间"
        return label
    }()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        layer.cornerRadius = 10
        layer.borderWidth = 1
        setupUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var frame: CGRect {
        didSet {
            var newFrame = frame
            newFrame.origin.x += 10
            newFrame.origin.y += 10
            newFrame.size = CGSize(width: frame.width-20, height: frame.height-10)
            super.frame = newFrame
        }
    }
    
    func setupUI() {
        contentView.addSubview(mainTitleLabel)
        
        mainTitleLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(contentView)
            make.left.equalTo(10)
            make.width.equalTo(120)
            make.height.equalTo(45)
        }
    }
    
}