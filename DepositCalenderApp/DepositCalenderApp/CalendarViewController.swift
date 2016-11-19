//
//  CalendarViewController.swift
//  DepositCalenderApp
//
//  Created by 行木太一 on 2016/11/12.
//  Copyright © 2016年 yuuki-MHTCode. All rights reserved.
//

import UIKit

//extension UIColor {
//    class func lightBlue() -> UIColor {
//        return UIColor(red: 92.0 / 255, green: 192.0 / 255, blue: 210.0 / 255, alpha: 1.0)
//    }
//    
//    class func lightRed() -> UIColor {
//        return UIColor(red: 195.0 / 255, green: 123.0 / 255, blue: 175.0 / 255, alpha: 1.0)
//    }
//}

class CalendarViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let dateManager = DateManager()
    let weekDayCount: Int = 7

    @IBOutlet weak var CalendarView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CalendarView.delegate = self
        CalendarView.dataSource = self
        CalendarView.backgroundColor = UIColor.white
        
        self.CalendarView.register(UINib(nibName: "CalendarCell", bundle: nil), forCellWithReuseIdentifier: "CalendarCell")
        
    }
    
    /// カレンダーのセルの個数を返す
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dateManager.dateCountInCurrentMonth()
    }

    /// 各セルに日付を設定する
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCell
        if indexPath.row % weekDayCount == 0 {
            // 日曜日のセル
            cell.backgroundColor = UIColor.lightPink()
        } else if indexPath.row % weekDayCount == 6 {
            // 土曜日のセル
            cell.backgroundColor = UIColor.lightGreen()
        } else {
            // 平日のセル
            cell.backgroundColor = UIColor.offWhite()
        }
        
        cell.dateNumber.text = dateManager.convertDateFormat(index: indexPath.row)
        cell.dateNumber.textColor = UIColor.brown()
        return cell
    }

    /// セルのサイズを設定
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = collectionView.frame.size.width / CGFloat(weekDayCount)
        let height: CGFloat = collectionView.frame.size.height / 6
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

