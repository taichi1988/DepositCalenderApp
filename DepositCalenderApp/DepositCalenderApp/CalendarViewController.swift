//
//  CalendarViewController.swift
//  DepositCalenderApp
//
//  Created by 行木太一 on 2016/11/12.
//  Copyright © 2016年 yuuki-MHTCode. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let dateManager = DateManager()
    let dayCountOfWeek = 7
    let weekCountOfMonth = 6

    @IBOutlet weak var CalendarView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CalendarView.delegate = self
        CalendarView.dataSource = self
        CalendarView.register(UINib(nibName: "CalendarCell", bundle: nil), forCellWithReuseIdentifier: "CalendarCell")
        
    }
    
    override func viewDidLayoutSubviews(){
        super.viewDidLayoutSubviews()
        self.navigationItem.title = "タイトル変更"
    }
    
    /// カレンダーのセルの個数を返す
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dateManager.dateCountInCurrentMonth()
//        return dayCountOfWeek * weekCountOfMonth
    }

    /// 各セルに日付を設定する
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCell
        if indexPath.row % dayCountOfWeek == 0 {
            // 日曜日のセル
            cell.backgroundColor = UIColor.lightPink()
        } else if indexPath.row % dayCountOfWeek == 6 {
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
        
        let width: CGFloat = collectionView.frame.size.width / CGFloat(dayCountOfWeek)
        let height: CGFloat = collectionView.frame.size.height / CGFloat(weekCountOfMonth)
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

