//
//  ExpenseInputViewController.swift
//  DepositCalenderApp
//
//  Created by 行木太一 on 2016/12/18.
//  Copyright © 2016年 yuuki-MHTCode. All rights reserved.
//

import UIKit

protocol ExpenseInputViewControllerDelegate: class {
    /// 項目と金額に入力されたテキストを
    /// 親の支出入力画面のTextViewへ反映させる
    /// - parameter item: 支出項目
    /// - parameter price: 支出金額
    ///
    func addExpense(item: String, price: String)
}

/// 支出入力フォームポップアップ画面
/// 入力した項目と金額は支出入力画面に追加される
///
class ExpenseInputViewController: UIViewController {
    
    weak var delegate: ExpenseInputViewControllerDelegate?
    
    /// 決定ボタン
    @IBOutlet weak var inputBtn: UIButton!
    /// 項目のテキストフィールド
    @IBOutlet weak var itemTextField: UITextField!
    /// 金額のテキストフィールド
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
    
    /// 決定ボタンアクション
    @IBAction func inputBtnTapped(_ sender: Any) {
        // 項目と金額の両テキストの空文字判定
        if let itemTxt = itemTextField.text, !itemTxt.isEmpty,
            let priceTxt = priceTextField.text, !priceTxt.isEmpty {
            // 空でなければ支出入力画面に追加する
            self.delegate?.addExpense(item: itemTxt, price: priceTxt)
            // 入力完了後テキストを消す
            itemTextField.text = ""
            priceTextField.text = ""
        }
    }
}

// MARK: - UITextField Delegate

extension ExpenseInputViewController: UITextFieldDelegate {
    /// 決定ボタンを押した時に呼ばれる
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
