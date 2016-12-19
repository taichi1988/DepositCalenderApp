//
//  ExpenseInputViewController.swift
//  DepositCalenderApp
//
//  Created by 行木太一 on 2016/12/18.
//  Copyright © 2016年 yuuki-MHTCode. All rights reserved.
//

import UIKit

class ExpenseInputViewController: UIViewController {

    @IBOutlet weak var inputBtn: UIButton!
    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        inputBtn.layer.cornerRadius = inputBtn.frame.height / 2
        inputBtn.setShadow(radius: 3, x: 0, y: 2)
        
        itemTextField.delegate = self
        priceTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func inputBtnTapped(_ sender: Any) {
    }
}

// MARK: UITextField Delegate
//
extension ExpenseInputViewController: UITextFieldDelegate {
    /// 完了ボタンを押した時に呼ばれる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // キーボードを隠す
        textField.resignFirstResponder()
        return true
    }
    
    /// テキストフィールドがフォーカスされた時に呼ばれる
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    /// テキストフィールド編集終了時に呼ばれる
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
}
