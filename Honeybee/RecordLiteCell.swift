//
//  RecordLiteCell.swift
//  Honeybee
//
//  Created by Dongbing Hou on 11/02/2017.
//  Copyright © 2017 Dongbing Hou. All rights reserved.
//

import UIKit

class RecordLiteCell: UITableViewCell {
    
    lazy var imgView = UIImageView(image: UIImage(named: "meal"))
    lazy var category: UILabel = {
        let label = UILabel()
        label.font = HonybeeFont.h5
        return label
    }()
    lazy var number: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.font = HonybeeFont.h3_number
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        layer.cornerRadius = HonybeeConstant.cornerRadius
        
        setupUI()
    }
    var model: Recorder? {
        didSet {
            category.text = model?.category
            number.text = model?.money
            backgroundColor = UIColor(hex: model!.color)
            print("---------\(frame)")
        }
    }
    override var frame: CGRect {
        didSet {
            var newFrame = frame
            newFrame.origin.y += 10
            newFrame.size = CGSize(width: frame.width, height: frame.height-10)
            super.frame = newFrame
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupUI() {
        contentView.addSubview(imgView)
        contentView.addSubview(category)
        contentView.addSubview(number)
        
        imgView.snp.makeConstraints { (make) in
            make.left.equalTo(contentView).offset(10)
            make.centerY.equalTo(contentView)
            make.width.height.equalTo(45)
        }
        category.snp.makeConstraints { (make) in
            make.centerY.equalTo(contentView)
            make.left.equalTo(imgView.snp.right).offset(10)
        }
        number.snp.makeConstraints { (make) in
            make.centerY.equalTo(category)
            make.left.equalTo(category.snp.right).offset(20)
            make.right.equalTo(contentView).offset(-10)
        }
        
    }
}

