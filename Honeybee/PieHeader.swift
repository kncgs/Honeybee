//
//  PieHeader.swift
//  Honeybee
//
//  Created by Dongbing Hou on 21/02/2017.
//  Copyright © 2017 Dongbing Hou. All rights reserved.
//

import UIKit
import Charts

class PieHeader: UIView {
    
    // ------------------------------
    // MARK: init
    // ------------------------------
    convenience init(height: CGFloat, names: [String], colors: [UIColor], percents: [Double]) {
        self.init(frame: CGRect(x: 0, y: 0, width: 0, height: height))
        pieView.data = PieHeaderData(names: names, colors: colors, percents: percents).data
    }
    convenience init(height: CGFloat) {
        self.init(frame: CGRect(x: 0, y: 0, width: 0, height: height))
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let gradientLayer = CAGradientLayer.gradient(colors: [UIColor(rgb: [248, 185, 81]), UIColor(rgb: [252, 91, 107])])
        gradientLayer.frame = CGRect(x: 10, y: 0, width: HB.Screen.w-20, height: frame.height)
        gradientLayer.cornerRadius = HB.Constant.cornerRadius
        layer.addSublayer(gradientLayer)

        addPieView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    lazy var pieView: PieChartView = {
        let pie = PieChartView()
        
        pie.drawHoleEnabled = true                      //中环，圆心环是否显示
        pie.holeColor = .white                          //圆心环颜色
        pie.holeRadiusPercent = 0.4                     //圆心环半径 默认50%
        pie.transparentCircleRadiusPercent = 0.5        //中环半径
        
        pie.drawEntryLabelsEnabled = true
        
        
        pie.rotationEnabled = false
        pie.animate(xAxisDuration: 1, yAxisDuration: 1, easingX: nil, easingY: nil)
        
        pie.legend.enabled = false
        
        pie.chartDescription = nil
        
        pie.highlightPerTapEnabled = false
        return pie
    }()
    
    // ------------------------------
    // MARK: create PieView
    // ------------------------------
    func addPieView() {
        addSubview(pieView)
        pieView.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
    }
}
