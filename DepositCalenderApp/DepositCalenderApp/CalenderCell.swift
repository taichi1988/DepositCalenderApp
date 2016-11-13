//
//  CalenderCell.swift
//  DepositCalenderApp
//
//  Created by 行木太一 on 2016/11/13.
//  Copyright © 2016年 yuuki-MHTCode. All rights reserved.
//

import UIKit

class CalendarCell: UICollectionViewCell {
    
    var textLabel: UILabel!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        // UILabelを生成
        textLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        textLabel.font = UIFont(name: "HiraKakuProN-W3", size: 12)
        textLabel.textAlignment = NSTextAlignment.center
        // Cellに追加
        self.addSubview(textLabel)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }   
 }
