//
//  UIView+shadow.swift
//  DepositCalenderApp
//
//  Created by 行木太一 on 2016/12/06.
//  Copyright © 2016年 yuuki-MHTCode. All rights reserved.
//

import UIKit

extension UIView {
    
    /// UIViewを継承するUIパーツにシャドウを設定するメソッド
    /// - parameter radius: 影のぼかし具合
    /// - parameter x: 水平方向の影の出し具合
    /// - parameter y: 垂直方向の影の出し具合
    ///
    func setShadow(radius: CGFloat, x: CGFloat, y: CGFloat) {
        self.layer.shadowOpacity = 1.0
        self.layer.shadowColor = UIColor.shadowColor().cgColor
        self.layer.shadowRadius = radius
        self.layer.shadowOffset = CGSize(width: x, height: y)
    }
}
