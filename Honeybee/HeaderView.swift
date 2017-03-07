//
//  HeaderView.swift
//  Honeybee
//
//  Created by Dongbing Hou on 08/02/2017.
//  Copyright © 2017 Dongbing Hou. All rights reserved.
//

import UIKit
import SnapKit

class HeaderView: UIView {
    
    lazy var usernameBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("二狗哥", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.titleLabel?.font = HB.Font.h2
        btn.contentHorizontalAlignment = .left
        return btn
    }()
    lazy var userImgView: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "avatar"))
        imgView.backgroundColor = HB.Color.nav
        imgView.layer.cornerRadius = 5
        imgView.layer.masksToBounds = true
        return imgView
    }()
    lazy var filterBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("分类", for: .normal)
        btn.setTitleColor(HB.Color.nav, for: .normal)
        btn.titleLabel?.font = HB.Font.h5
        btn.contentHorizontalAlignment = .left
        return btn
    }()
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = HB.Color.main
        view.layer.cornerRadius = HB.Constant.cornerRadius
        return view
    }()
    lazy var eyeBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "eye_close"), for: .normal)
        btn.setImage(UIImage(named: "eye_open"), for: .selected)
        return btn
    }()
    lazy var outLabel: UILabel = {
        let label = UILabel()
        label.font = HB.Font.h5
        label.textColor = UIColor.white
        label.text = "本月支出"
        return label
    }()
    lazy var inLabel: UILabel = {
        let label = UILabel()
        label.font = HB.Font.h5
        label.textColor = UIColor.white
        label.text = "本月收入"
        return label
    }()
    lazy var outMoneyLabel: UILabel = {
        let label = UILabel()
        label.font = HB.Font.h2_number
        label.textColor = UIColor.white
        label.text = "34567"
        return label
    }()
    lazy var inMoneyLabel: UILabel = {
        let label = UILabel()
        label.font = HB.Font.h2_number
        label.textColor = UIColor.white
        label.text = "76853"
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 205))
        
        setupUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapOnContainerView(_:)))
        containerView.addGestureRecognizer(tap)
        usernameBtn.addTarget(self, action: #selector(usernameBtnClicked), for: .touchUpInside)
        filterBtn.addTarget(self, action: #selector(filterBtnClicked(_:)), for: .touchUpInside)
        eyeBtn.addTarget(self, action: #selector(eyeBtnClicked(_:)), for: .touchUpInside)
        
        addSubview(usernameBtn)
        addSubview(userImgView)
        addSubview(filterBtn)
        addSubview(containerView)
        
        containerView.addSubview(eyeBtn)
        containerView.addSubview(outLabel)
        containerView.addSubview(outMoneyLabel)
        containerView.addSubview(inMoneyLabel)
        containerView.addSubview(inLabel)
        
        usernameBtn.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(10)
            make.top.equalTo(self)
        }
        userImgView.snp.makeConstraints { (make) in
            make.left.equalTo(usernameBtn.snp.right).offset(10)
            make.centerY.equalTo(usernameBtn)
            make.height.width.equalTo(40)
        }
        filterBtn.snp.makeConstraints { (make) in
            make.right.bottom.equalTo(self).offset(-10)
        }
        
        containerView.snp.makeConstraints { (make) in
            make.left.equalTo(usernameBtn)
            make.top.equalTo(usernameBtn.snp.bottom)
            make.bottom.equalTo(self).offset(-10)
            make.right.equalTo(filterBtn.snp.left).offset(-10).priority(HB.Priority.low)
        }
        eyeBtn.snp.makeConstraints { (make) in
            make.top.equalTo(containerView).offset(10)
            make.right.equalTo(containerView).offset(-10)
            make.width.equalTo(30)
            make.height.equalTo(20)
        }
        outLabel.snp.makeConstraints { (make) in
            make.left.top.equalTo(containerView).offset(10)
        }
        outMoneyLabel.snp.makeConstraints { (make) in
            make.left.equalTo(outLabel)
            make.top.equalTo(outLabel.snp.bottom)
        }
        inMoneyLabel.snp.makeConstraints { (make) in
            make.right.bottom.equalTo(containerView).offset(-10)
        }
        inLabel.snp.makeConstraints { (make) in
            make.right.equalTo(inMoneyLabel)
            make.bottom.equalTo(inMoneyLabel.snp.top)
        }
    }
    var tapContainerViewAction: (() -> ())?
    func tapOnContainerView(_ tap: UITapGestureRecognizer) {
        tapContainerViewAction?()
    }
    var usernameAction: (() -> ())?
    func usernameBtnClicked() {
        usernameAction?()
    }
    var filterAction: ((UIButton) -> ())?
    func filterBtnClicked(_ btn: UIButton) {
        filterAction?(btn)
    }
    func eyeBtnClicked(_ btn: UIButton) {
        btn.isSelected = !btn.isSelected
        containerView.rotateY360()
        if btn.isSelected {
            outMoneyLabel.text = "***"
            inMoneyLabel.text = "***"
        } else {
            outMoneyLabel.text = "123"
            inMoneyLabel.text = "34589"
        }
    }
}
