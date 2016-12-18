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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
