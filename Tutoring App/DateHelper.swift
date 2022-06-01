//
//  DateHelper.swift
//  SASE Tutoring App
//
//  Created by Angeli Faith Deanon on 2/24/22.
//

import Foundation

extension Date {
    func descriptiveString(dateStyle: DateFormatter.Style = .short) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = dateStyle
        
        let daysBetween = self.daysBetween(date: Date())
        if(daysBetween == 0){
            return "Today"
        }
        else if(daysBetween == 1){
            return "Yesterday"
        }
        else if(daysBetween < 5){
            let weekdayIndex = Calendar.current.component(.weekday, from: self)-1
            return formatter.weekdaySymbols[weekdayIndex]
            
        }
        return formatter.string(from: self)
    }
    
    func daysBetween(date: Date) -> Int{
        let calandar = Calendar.current
        let date1 = calandar.startOfDay(for: self)
        let date2 = calandar.startOfDay(for: date)
        if let daysBetween = calandar.dateComponents([.day], from: date1, to: date2).day{
            return daysBetween
        }
        return 0
    }
}
