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
    let cellMargin: CGFloat = 2.0
    let week = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]

    @IBOutlet weak var calenderView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calenderView.delegate = self
        calenderView.dataSource = self
        calenderView.backgroundColor = UIColor.white
        
    }
    
    /// セクション数を返す
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    // 各セクション内のセルの数を返す
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        // Section毎にCellの総数を変える.
        switch section {
        case 0:
            /// 曜日表示セクション
            return week.count
        default:
            /// 日付表示セクション
            return dateManager.numberOfDaysInCurrentMonth()
        }
    }

    /// セルの内容を設定する
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCell

        if indexPath.row % week.count == 0 {
            /// 日曜の列
            cell.textLabel.textColor = UIColor.lightRed()
        } else if indexPath.row % week.count == 6 {
            /// 土曜の列
            cell.textLabel.textColor = UIColor.lightBlue()
        } else {
            cell.textLabel.textColor = UIColor.gray
            cell.backgroundColor = UIColor.orange
        }
        
        /// テキスト配置
        if indexPath.section == 0 {
            cell.textLabel.text = week[indexPath.row]
        } else {
            //Index番号から表示する日を求める
            cell.textLabel.text = dateManager.conversionDateFormat(index: indexPath.row)
        }
        return cell
    }

    //セルのサイズを設定
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfMargin:CGFloat = 8.0
        let widths:CGFloat = (collectionView.frame.size.width - cellMargin * numberOfMargin)/CGFloat(week.count)
        let heights:CGFloat = widths * 0.8
        
        return CGSize(width:widths,height:heights)
    }
    
    
    
    //セルの垂直方向のマージンを設定
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return cellMargin
    }
    
    //セルの水平方向のマージンを設定
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        return cellMargin
    }
}

