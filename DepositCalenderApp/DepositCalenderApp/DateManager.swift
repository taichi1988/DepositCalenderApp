//
//  DateManager.swift
//  DepositCalenderApp
//
//  Created by 行木太一 on 2016/11/13.
//  Copyright © 2016年 yuuki-MHTCode. All rights reserved.
//

import Foundation

class DateManager: NSObject {
    
    var selectDay = Date()
    var biginDay = Date()
    var endDay = Date()
    let calendar = Calendar.current
    //月ごとのセルの数を返すメソッド
    func numberOfDaysInCurrentMonth() -> Int {
        //始まりの日と終わりの日を取得
        biginDay = firstDateOfMonth()
        endDay = EndOfMonthCalendar()
        
        //始点から終点の日数
        return calendar.dateComponents([.day], from:biginDay ,to:endDay).day! + 1
    }
    
    //月の初日を取得
    func firstDateOfMonth() -> Date {
        
        //日付の要素を1日にする
        var components = calendar.dateComponents([.year,.month,.day], from: selectDay)
        components.day = 1
        let firstOfMonth = Calendar.current.date(from: components)
        
        //曜日を調べて、その要素数だけ戻ったものがカレンダーの左上(日曜日=1 土曜日=7　なので1足した状態で戻る)
        let dayOfWeek = calendar.component(.weekday,from:firstOfMonth!)
        
        return calendar.date(byAdding: .day, value: 1-dayOfWeek, to: firstOfMonth!)!
    }
    
    //月カレンダーの終点になる日を求める
    func EndOfMonthCalendar() ->Date{
        
        //次の月初めを取得
        let nextmonth = calendar.nextDate(after: selectDay, matching: DateComponents(day:1), matchingPolicy: Calendar.MatchingPolicy.nextTime)
        
        //曜日を調べて、その要素数だけ進んだものが右下(次の月の初めで計算している事に注意)
        let dayOfWeek = calendar.component(.weekday,from: nextmonth!)
        
        return calendar.date(byAdding: .day, value: 7-dayOfWeek, to: nextmonth!)!
    }
    
    //カレンダーの始点から指定した日数を加算した日付を返す
    func conversionDateFormat(index: Int)->String{
        
        let currentday = calendar.date(byAdding: .day, value: index, to: biginDay)
        
        return calendar.component(.day, from: currentday!).description
    }
    
    
}

