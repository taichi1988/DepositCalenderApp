//
//  ExpenseViewController.swift
//  DepositCalenderApp
//
//  Created by 行木太一 on 2016/11/12.
//  Copyright © 2016年 yuuki-MHTCode. All rights reserved.
//

import UIKit
import PopupDialog

/// 支出入力画面
/// ExpenseInputViewControllerで入力された項目と金額が追加されていく
///
class ExpenseViewController: UIViewController {
    /// 日付のラベル
    @IBOutlet weak var dateLabel: UILabel!
    /// 支出項目と支出金額を出力する領域の背面のView
    @IBOutlet weak var textAreaBackView: UIView!
    /// 支出項目の表示領域
    @IBOutlet weak var itemTextView: UITextView!
    /// 支出金額の表示領域
    @IBOutlet weak var priceTextView: UITextView!
    /// 入力ボタン
    @IBOutlet weak var inputButton: UIButton!
    /// 支出入力画面インスタンス変数
    var inputVC: ExpenseInputViewController!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 支出入力画面インスタンス化
        inputVC = ExpenseInputViewController(nibName: "ExpenseInputViewController", bundle: nil)
        inputVC.delegate = self
        // 項目と金額を空文字で初期化
        itemTextView.text = ""
        priceTextView.text = ""
        
        // FIXME: TextViewにplaceHolderを！
        
        textAreaBackView.setShadow(radius: 10, x: 0, y: 2)
        inputButton.layer.cornerRadius = inputButton.frame.height/2
        inputButton.setShadow(radius: 2, x: 0, y: 2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func inputButtonTapped(_ sender: Any) {
        /// PopUpライブラリのインスタンス
        let popVC = PopupDialog(viewController: inputVC)
        // 入力フォームのポップアップを表示
        present(popVC, animated: true, completion: nil)
    }
}

// MARK: - ExpenseInputViewController Delegate

extension ExpenseViewController: ExpenseInputViewControllerDelegate {
    /// Delegate Method
    func addExpense(item: String, price: String) {
        // 支出入力フォームから渡ってきた項目と金額を追加する
        // 文末に改行を添えて縦並びにテキストを追加していく
        itemTextView.text = itemTextView.text + item + "\n"
        priceTextView.text = priceTextView.text + price + "\n"
    }
}
