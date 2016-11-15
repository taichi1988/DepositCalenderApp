//
//  CalenderViewController.swift
//  DepositCalenderApp
//
//  Created by 行木太一 on 2016/11/12.
//  Copyright © 2016年 yuuki-MHTCode. All rights reserved.
//

import UIKit

extension UIColor {
    class func lightBlue() -> UIColor {
        return UIColor(red: 92.0 / 255, green: 192.0 / 255, blue: 210.0 / 255, alpha: 1.0)
    }
    
    class func lightRed() -> UIColor {
        return UIColor(red: 195.0 / 255, green: 123.0 / 255, blue: 175.0 / 255, alpha: 1.0)
    }
}

class CalenderViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let dateManager = DateManager()
    let weekDayCount: Int = 7

    @IBOutlet weak var calenderView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calenderView.delegate = self
        calenderView.dataSource = self
        calenderView.backgroundColor = UIColor.white
        
        self.calenderView.register(UINib(nibName: "CalenderCell", bundle: nil), forCellWithReuseIdentifier: "CalenderCell")
        
    }
    
    /// カレンダーのセルの個数を返す
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dateManager.dateCountInCurrentMonth()
    }

    /// 各セルに日付を設定する
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalenderCell", for: indexPath) as! CalenderCell
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        
        if indexPath.row % weekDayCount == 0 {
            /// 日曜日のセル
            cell.dateNumber.textColor = UIColor.lightRed()
        } else if indexPath.row % weekDayCount == 6 {
            /// 土曜日のセル
            cell.dateNumber.textColor = UIColor.lightBlue()
        } else {
            /// 平日のセル
            cell.dateNumber.textColor = UIColor.gray
        }
        
        cell.dateNumber.text = dateManager.convertDateFormat(index: indexPath.row)
        return cell
    }

    /// セルのサイズを設定
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = collectionView.frame.size.width / CGFloat(weekDayCount)
        let height: CGFloat = collectionView.frame.size.height / 5
        return CGSize(width: width, height: height)
    }
    
    /// セルの垂直方向のマージンを設定
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    /// セルの水平方向のマージンを設定
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

