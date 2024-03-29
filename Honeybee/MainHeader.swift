

//
//  HeaderView.swift
//  Honeybee
//
//  Created by Dongbing Hou on 08/02/2017.
//  Copyright © 2017 Dongbing Hou. All rights reserved.
//
import UIKit
import SnapKit

class MainHeader: BaseHeader {
    
    lazy var usernameBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("二狗哥", for: .normal)
        btn.setTitleColor(.black, for: .normal)
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
    lazy var summaryView: UIView = {
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
        label.textColor = .white
        label.text = "本月支出"
        return label
    }()
    lazy var inLabel: UILabel = {
        let label = UILabel()
        label.font = HB.Font.h5
        label.textColor = .white
        label.text = "本月收入"
        return label
    }()
    lazy var outMoneyLabel: UILabel = {
        let label = UILabel()
        label.font = HB.Font.h2_number
        label.textColor = .white
        label.text = "0"
        return label
    }()
    lazy var inMoneyLabel: UILabel = {
        let label = UILabel()
        label.font = HB.Font.h2_number
        label.textColor = .white
        label.text = "0"
        return label
    }()
    override func setupUI() {
        super.setupUI()
        rightBtn.setTitle("分类", for: .normal)
        containerView.isUserInteractionEnabled = true

        let tap = UITapGestureRecognizer(target: self, action: #selector(tapOnContainerView(_:)))
        summaryView.addGestureRecognizer(tap)
        usernameBtn.addTarget(self, action: #selector(usernameBtnClicked), for: .touchUpInside)
        eyeBtn.addTarget(self, action: #selector(eyeBtnClicked(_:)), for: .touchUpInside)

        
        containerView.addSubview(usernameBtn)
        containerView.addSubview(userImgView)
        containerView.addSubview(summaryView)
        
        summaryView.addSubview(eyeBtn)
        summaryView.addSubview(outLabel)
        summaryView.addSubview(outMoneyLabel)
        summaryView.addSubview(inMoneyLabel)
        summaryView.addSubview(inLabel)
        
        containerView.addSubview(summaryView)
        
        usernameBtn.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(10)
            make.top.equalTo(self)
        }
        userImgView.snp.makeConstraints { (make) in
            make.left.equalTo(usernameBtn.snp.right).offset(10)
            make.centerY.equalTo(usernameBtn)
            make.height.width.equalTo(40)
        }
        
        summaryView.snp.makeConstraints { (make) in
            make.left.equalTo(usernameBtn)
            make.top.equalTo(usernameBtn.snp.bottom)
            make.right.equalTo(containerView)
            make.bottom.equalTo(containerView).offset(-5)
        }
        eyeBtn.snp.makeConstraints { (make) in
            make.top.equalTo(summaryView).offset(10)
            make.right.equalTo(summaryView).offset(-10)
            make.width.equalTo(30)
            make.height.equalTo(20)
        }
        outLabel.snp.makeConstraints { (make) in
            make.left.top.equalTo(summaryView).offset(10)
        }
        outMoneyLabel.snp.makeConstraints { (make) in
            make.left.equalTo(outLabel)
            make.top.equalTo(outLabel.snp.bottom)
        }
        inMoneyLabel.snp.makeConstraints { (make) in
            make.right.bottom.equalTo(summaryView).offset(-10)
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
        summaryView.rotateY360()
        
        btn.isSelected = !btn.isSelected
        
        if btn.isSelected {
            outMoneyLabel.isHidden = true
            inMoneyLabel.isHidden = true
//            outMoneyLabel.text = "***"
//            inMoneyLabel.text = "***"
        } else {
            
            outMoneyLabel.isHidden = false
            inMoneyLabel.isHidden = false
//            outMoneyLabel.text = outMoneyLabel.text
//            inMoneyLabel.text = inMoneyLabel.text
        }
    }
}
