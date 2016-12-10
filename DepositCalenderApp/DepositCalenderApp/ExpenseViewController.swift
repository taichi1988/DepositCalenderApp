//
//  ExpenseViewController.swift
//  DepositCalenderApp
//
//  Created by 行木太一 on 2016/11/12.
//  Copyright © 2016年 yuuki-MHTCode. All rights reserved.
//

import UIKit

class ExpenseViewController: UIViewController {
    /// 日付のラベル
    @IBOutlet weak var dateLabel: UILabel!
    /// 支出出力領域の背面のView
    @IBOutlet weak var textAreaBackView: UIView!
    /// 入力ボタン
    @IBOutlet weak var inputButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textAreaBackView.setShadow(radius: 10, x: 0, y: 2)
        inputButton.layer.cornerRadius = inputButton.frame.height/2
        inputButton.setShadow(radius: 2, x: 0, y: 2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func inputButtonTapped(_ sender: Any) {
        
    }
}
