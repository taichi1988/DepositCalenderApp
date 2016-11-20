//
//  DateManager.swift
//  DepositCalenderApp
//
//  Created by 行木太一 on 2016/11/13.
//  Copyright © 2016年 yuuki-MHTCode. All rights reserved.
//

import Foundation

class DateManager: NSObject {
    
    var selectedDay = Date()
    var beginningDate = Date()
    var lastDate = Date()
    let calendar = Calendar.current
    
    /// 現在の月のセルの数を返すメソッド
    func dateCountInCurrentMonth() -> Int {
        // 始まりの日と終わりの日を取得
        beginningDate = firstDateOfMonth()
        lastDate = endDateOfMonth()
        // 始点から終点の日数
        return calendar.dateComponents([.day], from:beginningDate ,to:lastDate).day! + 1
    }
    
    /// カレンダーの起点の日付を取得
    func firstDateOfMonth() -> Date {
        /// 現在日付のコンポーネント
        var components = calendar.dateComponents([.year,.month,.day], from: selectedDay)
        // 日付の要素を1日に指定
        components.day = 1
        /// 今月1日のデータ
        let firstDate = Calendar.current.date(from: components)
        /// 今月1日の曜日
        let weekOfFirstDay = calendar.component(.weekday, from:firstDate!)
        /// 取得した1日の曜日から、同じ週の日曜日が何日になるかを取得する
        let startDateOfCalender = calendar.date(byAdding: .day, value: 1 - weekOfFirstDay, to: firstDate!)!
        return startDateOfCalender
    }
    
    /// カレンダーの終点になる日付を求める
    func endDateOfMonth() -> Date {
        /// 今月の最後の日のデータ
        let lastDate = calendar.nextDate(after: selectedDay, matching: DateComponents(day:1), matchingPolicy: Calendar.MatchingPolicy.nextTime)
        /// 今月の最後の日付の曜日
        let weekOfLastDate = calendar.component(.weekday,from: lastDate!)
        /// 今月の最後の日付の曜日を調べて、その要素数だけ進んだものが右下(次の月の初めで計算している事に注意)
        let lastDateOfCalender = calendar.date(byAdding: .day, value: 7 - weekOfLastDate, to: lastDate!)!
        return lastDateOfCalender
    }
    
    /// カレンダーの始点から引数で渡ってきたカレンダーセルのインデックスを加算した日付の文字列を返す
    func convertDateFormat(index: Int) -> String {
        /// カレンダーの起点の日付にカレンダーセルのインデックス番号を足した日にち
        let date = calendar.date(byAdding: .day, value: index, to: beginningDate)
        return calendar.component(.day, from: date!).description
    }
    
    
}

